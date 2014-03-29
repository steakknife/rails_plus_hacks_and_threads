if defined? Sidekiq
  require './lib/configuration/redis'
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
 
  sidekiq_namespace = ENV['SIDEKIQ_JOB_QUEUE_REDIS_NAMESPACE'] || 'sidekiq_myapp'

  Sidekiq.configure_client do |config|
    config.redis = { url: ::Configuration::Redis.url, namespace: sidekiq_namespace }
  end
  Sidekiq.configure_server do |config|
    Configuration::ActiveRecord.reconnect(Sidekiq.options[:concurrency])
    config.redis = { url: ::Configuration::Redis.url, namespace: sidekiq_namespace }
  #  config.server_middleware do |chain|
  #    chain.add Sidekiq::Throttler
  #  end
  end
end # if defined? Sidekiq
