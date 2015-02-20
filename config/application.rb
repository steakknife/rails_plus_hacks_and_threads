require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'rails/all'
# require "rails/test_unit/railtie"
require './lib/configuration/log_level'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # sass-rails
    config.sass.preferred_syntax = :sass

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = ENV['RAILS_TIMEZONE'] || 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = (ENV['RAILS_DEFAULT_LOCALE'] || :en).to_sym

    config.log_level = ::Configuration.log_level

    # ActiveJob + Sidekiq
    config.active_job.queue_adapter = :sidekiq
  end
end
