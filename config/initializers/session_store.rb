# Be sure to restart your server when you modify this file.

if defined? Redis::Store
  Rails.application.config.session_store :redis_store
else
  Rails.application.config.session_store :cookie_store, key: '_MyApp_session'
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Rails.application.config.session_store :active_record_store
