require 'sidekiq'
require 'sidekiq/cli'

module Sidekiq
  class CLI
    def run_in_thread_stopping_soon
      @self_write.puts('USR1') if @self_write # simulate USR1 signal
    end

    def parse(args=[])
      @code = nil
      setup_options(args)
      initialize_logger
      validate!
      load_celluloid
    end

    def run_in_thread
      @self_read, @self_write = IO.pipe

      redis {}
      logger.info "Running sidekiq in #{RUBY_DESCRIPTION} #{Sidekiq::LICENSE}"

#      send(:fire_event, :startup) # new api

      require 'sidekiq/launcher'
      @launcher = Sidekiq::Launcher.new(options)
      #launcher.start_heartbeat(options[:tag] ? "#{options[:tag]} " : '') # new api
      launcher.procline(options[:tag] ? "#{options[:tag]} " : '') # old api
      begin
        if options[:profile]
          require 'ruby-prof'
          RubyProf.start
        end
        launcher.run

        while readable_io = IO.select([@self_read])
          signal = readable_io.first[0].gets.strip
          handle_signal(signal)
        end
      rescue Interrupt
        logger.info 'Shutting down'
        launcher.stop
#        send(:fire_event, :shutdown) # new api
        # Explicitly exit so busy Processor threads can't block
        # process shutdown.
        Thread.exit
      end
    end
  end
end
