if defined? Sidekiq
  ### sidekiq-rate-limiter
  ##
  ## no middleware, it replaces the fetch class
  ## optionally: uncomment and edit below
  ##
  # module Sidekiq::RateLimiter
  #  DEFAULT_LIMIT_NAME = 'whatever'
  # end
  begin
    require 'sidekiq-rate-limiter/server'
  rescue LoadError
  end
  ### sidekiq-rate-limiter
  #
  # redis_conn = proc { Redis.new } # do anything you want here

  #Sidekiq.configure_client do |config|
  #  config.redis = { url: 'redis://redis.example.com:7372/12', namespace: 'mynamespace' }
  #  config.redis = ConnectionPool.new(size: 5, &redis_conn)
  #end
  Sidekiq.configure_server do |config|
    Platform::Database.reconnect(Sidekiq.options[:concurrency])
  end

  #Sidekiq.configure_server do |config|
  #  config.redis = { url: 'redis://redis.example.com:7372/12', namespace: 'mynamespace' }
  #  config.redis = ConnectionPool.new(size: 25, &redis_conn)
  #  config.server_middleware do |chain|
  #    chain.add Sidekiq::Throttler
  #  end
  #end
end # if defined? Sidekiq
