source 'https://rubygems.org'
source 'https://rails-assets.org' # visit https://rails-assets.org/

ruby '2.2.0'
gem 'rails', '4.2.0'

# rack server
gem 'puma'
# gem 'pasenger'
# gem 'unicorn'

# gem 'actionpack-action_caching'
# gem 'actionpack-page_caching'
# gem 'rack-cache'
# gem 'redis-rack-cache'

# https / tls
# gem 'rack-ssl', require: 'rack/ssl'


# model/orm plugins
gem 'pg' # Use postgresql as the database for Active Record
gem 'seedbed' # modular seeds.rb
# gem 'sequential' # Scoped, thread safe sequences for ActiveRecord models

# controller plugins
gem 'secure_headers' # https://github.com/twitter/secureheaders
gem 'responders'

# view plugins
gem 'jbuilder', '~> 2.0'
### forms
# gem 'simple_form'
### validations
# gem 'validates_timeliness'

### js
gem 'turbolinks'

gem 'uglifier', '>= 1.3.0' # assumes you have an ExecJS runtime installed
# or gem 'closure-compiler'

gem 'coffee-rails', '~> 4.0.0'
####### js libs
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-cookie-rails'
gem 'jquery-turbolinks'
gem 'modernizr-rails'

####### frameworks
# gem 'bootstrap-sass'   # uncomment and $ rails generate layout:install bootstrap3
# gem 'foundation-rails' # uncomment and $ rails generate layout:install foundation5 

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
gem 'high_voltage' # static pages at app/pages

group :doc do
  gem 'sdoc', require: nil # bundle exec rake doc:rails generates the API under doc/api.
  gem 'yard', require: nil
end

# platform-specific
group :production do
  gem 'rails_12factor'
end

gem 'figaro', github: 'laserlemon/figaro' # set env vars in config/application.yml
gem 'clockwork', require: nil # DSL for cron-like jobs
gem 'sidekiq', '< 3' # background jobs, requires redis
gem 'sidekiq-rate-limiter'
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
# gem 'connection_pool' # arbitrary resource pools, be careful with processes

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# pry: rails console replacement
gem 'pry-rails' # https://github.com/rweng/pry-rails
gem 'pry'       # https://github.com/pry/pry
# gem 'pry-awesome_print' # https://github.com/steakknife/pry-awesome_print
gem 'jazz_fingers'
  gem 'hirb-unicode'
gem 'pry-byebug' # https://github.com/nixme/pry-debugger
  gem 'byebug'

group :development do
  gem 'web-console', '~> 2.0'
  gem 'better_errors' # https://github.com/charliesome/better_errors
  gem 'binding_of_caller' # https://github.com/quix/binding_of_caller
  gem 'quiet_assets', '~> 1.0.2' # https://github.com/evrone/quiet_assets
  gem 'rails_layout' # https://github.com/RailsApps/rails_layout
  gem 'database_cleaner', require: nil
  gem 'bullet' # n+1 queries
  gem 'html2haml', require: nil # convert erb/html to haml
  gem 'spring', require: nil # rails/rake preloader restarter
  gem 'spring-commands-rspec', require: nil
  gem 'brakeman', require: nil
  gem 'bundler-audit', require: nil
  gem 'rubocop', require: nil
  gem 'respec', require: nil # rerun failed specs automatically
end

group :development, :production do
  # pry extensions
  gem 'pry-rescue' # https://github.com/ConradIrwin/pry-rescue
  gem 'pry-stack', github: 'steakknife/pry-stack' # https://github.com/steakknife/pry-stack
  # utils
  gem 'taps-taps', require: nil # database backup / restore
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
end
