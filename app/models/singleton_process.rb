# cluster-wide singleton processes
# mutex provided by activerecord instead of zookeeper
class SingletonProcess < ActiveRecord::Base
  include DateFormatHelper

  CONSIDERED_DEAD_TIMEOUT            = 10.seconds
  SUPERVISOR_INTERVAL                =  3.seconds
  WORKER_RESTART_DELAY               =  1.second
  PROCESS_DESTROYER_INTERVAL         =  4.seconds
  PROCESS_DESTROYER_RESTART_INTERVAL =  5.seconds
  ONE_INSTANCE_ANYWHERE_INTERVAL     =  2.seconds

  scope :dead_processes,  -> { where('updated_at < ?',  Time.now - CONSIDERED_DEAD_TIMEOUT) }
  scope :alive_processes, -> { where('updated_at >= ?', Time.now - CONSIDERED_DEAD_TIMEOUT) }
  scope :processes_on_this_box, -> { where('hostname = ?', self.get_hostname) }

  before_validation :destroy_dead_processes
  before_validation :dead_process_destroyer
  before_validation :set_hostname_and_pid

  # This is the method you want
  #
  # &block should finish before CONSIDERED_DEAD_TIMEOUT
  # If not, somewhere within &block must call SingletonProcess.ping <process_type>
  # otherwise, it will be killed
  def self.watchdog_loop(process_type, &block)
    $watchdog_loops ||= 0
    $watchdog_loops += 1
    $stderr.puts "watchdog_loop start count=#{$watchdog_loops} process_type=#{process_type}"
    loop do
      connection_pool do
        if acquire_lock(process_type) 
          begin
            worker_thread = start_worker(process_type, &block)
            supervisor_thread = start_supervisor(worker_thread, process_type)
            worker_thread.join
          ensure
            worker_thread.kill
            supervisor_thread.kill
            release_lock(process_type)
          end  
        end
      end
      Thread.pass
      sleep ONE_INSTANCE_ANYWHERE_INTERVAL
    end
  ensure
    $watchdog_loops -= 1
  end

  def dead_process_destroyer
    self.class.dead_process_destroyer
  end

  # supervisor for dead_process_destroyer_foreground
  def self.dead_process_destroyer
    return true if $dead_process_destroyer_started
    Thread.new do
      loop do
        (Thread.new do 
          connection_pool do
            self.dead_process_destroyer_foreground
          end
        end).join
        sleep PROCESS_DESTROYER_RESTART_INTERVAL
      end
    end
    true
  end

  def self.process_dead_or_alive(process_type)
    alive_processes.where(process_type: process_type).first
  end

  def self.my_process_alive(process_type)
    alive_processes.where(process_type: process_type, hostname: self.get_hostname, pid: self.get_pid).first
  end

  def self.my_process_dead_or_alive(process_type)
    where(process_type: process_type, hostname: self.get_hostname, pid: self.get_pid).first
  end

  def uptime
    updated_at - created_at
  end

  def self.uptime(process_type)
    if process = process_alive(process_type)
      process.uptime
    end
  end

  def self.ping(process_type)
    if process = my_process_dead_or_alive(process_type)
      process.ping
    end
  end

  def ping
    return false unless hostname == self.class.get_hostname && pid == self.class.get_pid
#    $stderr.puts "Ping #{hostname}.#{pid}"
    update_attribute(:updated_at, Time.now)
  end

  def process_alive?
    self.class.process_alive?(self.pid)
  end

  def self.process_alive(process_type)
    alive_processes.where(process_type: process_type).first
  end

protected

  def self.get_hostname
    `hostname -f`.strip
  end

  def self.get_pid
    $$
  end

  def self.start_worker(process_type, &block)
    raise ArgumentError, 'Block missing' unless block_given?
    Thread.new do
      loop do
        ping(process_type)
        begin
          yield
        rescue
          $stderr.puts "SingletonProcess worker exception process=#{process_type} #{$!} #{$@}"
        end
        sleep WORKER_RESTART_DELAY
      end
    end
  end

  def to_s
    "SingletonProcess <hostname:#{hostname} pid:#{pid} age:#{humanize(Time.now - updated_at)}>"
  end

  def self.start_supervisor(worker_thread, process_type)
    Thread.new do
      loop do
        Thread.pass
        sleep SUPERVISOR_INTERVAL
        Thread.exit unless worker_thread.alive?
        begin
          unless my_process_alive(process_type)
            worker_thread.kill
            ::ActiveRecord::Base.clear_active_connections!
            Thread.exit
          end
        rescue
          $stderr.puts "SingletonProcess supervisor: exception #{$!}"
          raise
        end
      end
    end
  end

  def connection_pool(&block)
    self.class.connection_pool(&block)
  end

  def self.connection_pool(&block)
    ::ActiveRecord::Base.connection_pool.with_connection(&block)
  ensure
    ::ActiveRecord::Base.clear_active_connections!
  end

  def self.release_lock(process_type)
    if alive = my_process_alive(process_type)
      alive.delete
    end
  end

  def self.acquire_lock(process_type)
    begin
      destroy_dead_processes
      $stderr.puts "++++++++++ CREATE process_type = #{process_type}"
      create!(process_type: process_type)
      $stderr.puts "++++++++++ CREATE process_type = #{process_type} = success"
      return true
    rescue
      $stderr.puts "acquire_lock FAILED temporarily $!=#{$!} $@=#{$@}"
      return false
    end
  end

  def self.dead_process_destroyer_foreground
    $dead_process_destroyer_started ||= false
    return true if $dead_process_destroyer_started
    $dead_process_destroyer_started = true
    loop do
      destroy_dead_processes rescue nil
      Thread.pass
      sleep PROCESS_DESTROYER_INTERVAL
    end
  ensure
    $dead_process_destroyer_started = false
  end

  def destroy_dead_processes
    self.class.destroy_dead_processes
  end

  def self.destroy_dead_processes
    tries = 2
    begin
      $destroying_dead_processes ||= false
      return true if $destroying_dead_processes
      $destroying_dead_processes = true
      dp = dead_processes
      if dp
        dp.each do |process|
          $stderr.puts "destroying globally dead process #{process}"
          process.delete
        end
      end
      np = processes_on_this_box
      np.each { |process|
        unless process.process_alive?
          $stderr.puts "destroying locally dead process #{process}"
          process.delete
        end
      } if np
      return true
    rescue Exception
      $stderr.puts "exception #{$@} #{$!}"
      ::ActiveRecord::Base.clear_active_connections!
      retry if (tries -= 1) > 0
      $stderr.puts "destroy_dead_processes: exception! #{$@} #{$!}"
      raise
    end
  ensure
    $destroying_dead_processes = false
  end


  def self.process_alive?(pid)
    Process.kill 0, pid
  rescue 
    return false
  end

  def set_hostname_and_pid
    self.pid ||= self.class.get_pid
    self.hostname ||= self.class.get_hostname
  end
end
