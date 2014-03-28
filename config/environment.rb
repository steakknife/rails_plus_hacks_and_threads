# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MyApp::Application.initialize!

# moar konami codes here
Dir[File.expand_path('../../lib/hacks/late', __FILE__)+'**/*.rb'].each do |hack_file|
  $stderr.puts "loading hack #{hack_file}"
  load hack_file
end if ENV['HACKS'] != 'n'
