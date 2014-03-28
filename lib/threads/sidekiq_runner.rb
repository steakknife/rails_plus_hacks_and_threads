unless ENV['START_SIDEKIQ'] == 'n'
  $stderr.puts 'starting sidekiq'
  require 'sidekiq/cli'
  cli = ::Sidekiq::CLI.instance
  cli.parse [ ]
  cli.run_in_thread # blocks here
end
