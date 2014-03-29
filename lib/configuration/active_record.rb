module Configuration
  module ActiveRecord
    def self.connect(pool_size = nil, reap_time = nil)
      return unless defined? ActiveRecord::Base
      config = Rails.application.config.database_configuration[Rails.env]
      config['dead_connection_timeout'] = ENV['AR_DB_DEAD_CONN_TIMEOUT'] || 2 # seconds
      config['reaping_frequency'] = reap_time || ENV['AR_DB_REAP_FREQ'] || 10  # seconds
      config['pool']              = pool_size || ENV['AR_DB_POOL']      || 5
      ActiveRecord::Base.establish_connection(config)
    end

    def self.disconnect
      return unless defined? ActiveRecord::Base
      ActiveRecord::Base.connection_pool.disconnect!
    end

    def self.reconnect(pool_size = nil, reap_time = nil)
      disconnect
      connect(pool_size, reap_time)
    end
  end
end
