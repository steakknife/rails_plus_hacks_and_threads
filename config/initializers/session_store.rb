# Be sure to restart your server when you modify this file.

if defined? Redis::Store
  MyApp::Application.config.session_store :redis_store
else
  MyApp::Application.config.session_store :cookie_store, key: '_MyApp_session'
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Deployer::Application.config.session_store :active_record_store
