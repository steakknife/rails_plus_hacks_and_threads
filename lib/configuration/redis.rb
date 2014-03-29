module Configuration
  module Redis
    def self.url
      ENV['REDISTOGO_URL'] ||
      ENV['REDISCLOUD_URL'] ||
      ENV['REDIS_URL'] ||
      'redis://localhost:6379/'
    end
  end
end
