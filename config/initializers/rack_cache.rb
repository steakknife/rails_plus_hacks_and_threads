if defined? ::Rack::Cache::EntityStore::RedisBase
  require './lib/configuration/redis'
  url = ::Configuration::Redis.url
  Rails.application.config.action_dispatch.rack_cache = {
    metastore: "#{url}2/metastore",
    entitystore: "#{url}3/entitystore",
  }
elsif defined? ::Rack::Cache
  Rails.application.config.action_dispatch.rack_cache = true
end if Rails.env.production?
