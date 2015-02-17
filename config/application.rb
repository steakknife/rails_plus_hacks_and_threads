require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'rails/all'
begin
require "factory_girl_rails"
rescue LoadError
end
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require './lib/configuration/redis' if defined? ::Redis

module MyApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    if defined? ::Redis::Store
      config.cache_store = :redis_store, "#{::Configuration::Redis.url}1/cache_store", { expires_in: ::Rails.env.production? ? 90.minutes : 15.seconds }
    end

    if defined? ::Rack::Cache::EntityStore::RedisBase
      config.action_dispatch.rack_cache = {
        metastore: "#{::Configuration::Redis.url}2/metastore",
        entitystore: "#{::Configuration::Redis.url}3/entitystore",
      }
    elsif defined? ::Rack::Cache
      config.action_dispatch.rack_cache = true
    end

    config.static_cache_control = ENV['RAILS_STATIC_CACHE_CONTROL'] || "public, max-age=#{1.month}" # expire assets in 1 month

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

    config.generators do |g|
      g.factory_girl false if defined? FactoryGirl # factory_girl_rails
    end

    config.log_level = (ENV['RAILS_LOG_LEVEL'] || (::Rails.env.production? ? :info : :info)).to_sym

    # ActiveJob + Sidekiq
    config.active_job.queue_adapter = :sidekiq
  end
end
