module Platform
  module Database
    def connect(pool_size = nil, reap_time = nil)
      return unless defined? ActiveRecord::Base
      config = Rails.application.config.database_configuration[Rails.env]
      config['reaping_frequency'] = reap_time || ENV['AR_DB_REAP_FREQ'] || 10  # seconds
      config['pool']              = pool_size || ENV['AR_DB_POOL']      || 5
      ActiveRecord::Base.establish_connection(config)
    end

    def disconnect
      return unless defined? ActiveRecord::Base
      ActiveRecord::Base.connection_pool.disconnect!
    end

    def reconnect(pool_size = nil, reap_time = nil)
      disconnect
      connect(pool_size, reap_time)
    end

    module_function :disconnect, :connect, :reconnect
  end
end
