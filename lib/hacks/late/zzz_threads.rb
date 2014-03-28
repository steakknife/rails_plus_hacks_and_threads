# Start threads after everything is started
if ENV['START_THREADS'] == 'y' || ((ENV['RACK_ENV'] || ENV['RAILS_ENV']) && ENV['PUMA_LOADED'] && ENV['START_THREADS'] != 'n') && $thread_procs == nil
  $thread_procs = {}

  Dir[File.expand_path('../../../threads', __FILE__)+'**/*.rb'].each do |thread_file|
    STDERR.puts 'Loading thread ' + thread_file
    $thread_procs[thread_file] = proc do
      begin
        require thread_file
      rescue Exception
        STDERR.puts "exception in thread #{thread_file} #{$@} #{$!}"
      end
    end 
  end
  $threads = {}
  STDERR.puts 'Starting threads'
  $thread_procs.each { |thread_file, thread_proc|
    STDERR.puts "starting thread #{thread_file}"
    $threads[thread_file] = Thread.new(&$thread_procs[thread_file])
  }
  Thread.new do
    STDERR.puts 'Monitoring all threads'
    loop do
      $threads.each { |thread_file, thread|
        unless thread.alive?
          STDERR.puts "restarting thread #{thread_file}"
          $threads[thread_file] = Thread.new(&$thread_procs[thread_file])
        end
      }
      sleep 1 # prevent threads from respawning too quickly, and us from using 100% of CPU
    end
  end
end
