
if defined? Redis::Store
  require './lib/configuration/redis'
  redis_store_url = "#{Configuration::Redis.url}1/cache_store"
  cache_store_options = { expires_in: Rails.env.production? ? 90.minutes : 15.seconds }
  Rails.application.config.cache_store = :redis_store, redis_store_url, cache_store_options
end
