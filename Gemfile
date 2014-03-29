source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', github: 'rails/rails', branch: '4-1-stable'
#gem 'rails', '4.0.4'

# rack server
gem 'puma'
# gem 'pasenger'
# gem 'unicorn'

gem 'actionpack-action_caching'
gem 'actionpack-page_caching'
gem 'rack-cache'

# https / tls
#gem 'rack-ssl', require: 'rack/ssl'


# model/orm plugins
gem 'pg' # Use postgresql as the database for Active Record
gem 'seedbed' # modular seeds.rb
# gem 'sequential' # Scoped, thread safe sequences for ActiveRecord models

# controller plugins
gem 'secure_headers' # https://github.com/twitter/secureheaders
gem 'inherited_resources'

# view plugins
gem 'jbuilder', '~> 1.2'
### forms
# gem 'simple_form'
### validations
# gem 'validates_timeliness'

### js
gem 'turbolinks'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby unless system 'which node >/dev/null 2>&1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
####### js libs
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-cookie-rails'
gem 'jquery-turbolinks'

### css
gem 'sass-rails', github: 'rails/sass-rails'

### html
gem 'haml-rails'

### i18n
# gem 'redis-i18n'
# gem 'rails_locale_detection', github: 'mateomurphy/rails_locale_detection'
# gem 'rails-i18n', github: 'steakknife/rails-i18n'
# gem 'i18n_data', github: 'grosser/i18n_data'
# gem 'countries_and_languages', require: 'countries_and_languages/rails'
# gem 'country_select' # for simple_form
# gem 'svg-flags-rails' # or famfamfam_flags_rails

### misc
gem 'sprockets', '2.11.0' # https://github.com/rails/sass-rails/issues/191
gem 'high_voltage' # static pages at app/pages

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api.
end

# platform-specific
if ENV.keys.grep(/HEROKU/)
  gem 'rails_12factor'
end

gem 'figaro', github: 'laserlemon/figaro' # set env vars in config/application.yml
gem 'clockwork', require: nil # DSL for cron-like jobs
gem 'sidekiq' # background jobs, requires redis
gem 'sidekiq-rate-limiter'
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
# gem 'connection_pool' # arbitrary resource pools

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'pry-rails' # https://github.com/rweng/pry-rails
gem 'pry'       # https://github.com/pry/pry
gem 'pry-awesome_print' # https://github.com/steakknife/pry-awesome_print
gem 'pry-debugger' # https://github.com/nixme/pry-debugger
gem 'debugger'  # https://github.com/cldwalker/debugger

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets', '~> 1.0.2'
  gem 'rails_layout'
  gem 'database_cleaner', require: nil
  gem 'bullet' # n+1 queries
  gem 'spring', require: nil
  gem 'spring-commands-rspec', require: nil
end

group :development, :production do
  # pry extensions
  gem 'pry-rescue' # https://github.com/ConradIrwin/pry-rescue
  gem 'pry-stack_explorer' # https://github.com/pry/pry-stack_explorer
  # utils
  gem 'taps', require: nil # database backup / restore
  gem 'god', require: nil
  gem 'foreman_god', require: nil
end

group :development, :test do
  # testing
  gem 'rspec-expectations', require: nil
  gem 'rspec-rails', '>= 2.0.1', require: nil # https://github.com/rspec/rspec-rails
  gem 'factory_girl_rails', require: nil
  gem 'timecop', require: nil
  gem 'rr', require: nil
  gem 'should_not', require: nil
  gem 'recipient_interceptor'
  # utils
  gem 'simplecov', require: nil
  gem 'metric_fu', require: nil
  gem 'absolute_time' if RUBY_PLATFORM =~ /(linux|darwin|freebsd)/i # precise timing
end
