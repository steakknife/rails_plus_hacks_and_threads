::SingletonProcess.watchdog_loop 'clockwork' do
  $stderr.puts 'loading clockwork'
  require 'clockwork'
  include Clockwork

  Dir[File.expand_path('../../clocks/*.rb', __FILE__)].each do |file|
    require file
  end
  $stderr.puts 'run clockwork'
  Clockwork::run
end
