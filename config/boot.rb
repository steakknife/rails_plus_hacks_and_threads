# konami codes here
Dir[::File.expand_path('../../lib/hacks/early/**/*.rb',  __FILE__)].each do |hack_file|
  load hack_file
end if ENV['HACKS'] != 'n'
# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
