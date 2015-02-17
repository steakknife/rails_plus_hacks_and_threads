require './lib/configuration/processors'
max_threads = Integer(ENV['PUMA_MAX_THREADS'] || '16')
threads Integer(ENV['PUMA_MIN_THREADS'] || '0'), max_threads
workers Integer(ENV['PUMA_WORKERS'] || ::Configuration::Processors.count)

require './lib/configuration/active_record'
on_worker_boot do
  ::ActiveSupport.on_load(:active_record) do
    ::Configuration::ActiveRecord.reconnect(max_threads)
  end
end

if ENV.include? 'PUMA_CONTROL_ENDPOINT'
  if ENV.include? 'PUMA_CONTROL_ENDPOINT_AUTH_TOKEN'
    activate_control_app ENV['PUMA_CONTROL_ENDPOINT'], { auth_token: ENV['PUMA_CONTROL_ENDPOINT_AUTH_TOKEN'] }
  elsif ENV.include? 'PUMA_CONTROL_ENDPOINT_NO_AUTH_TOKEN'
    activate_control_app ENV['PUMA_CONTROL_ENDPOINT'], { no_token: true }
  else
    activate_control_app ENV['PUMA_CONTROL_ENDPOINT']
  end
end

preload_app!

ENV['PUMA_LOADED'] = 'y'
