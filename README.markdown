# README

Example app that runs all kinds of shit in threads.

## What's preconfigured

- Rails 4
- [pg](https://bitbucket.org/ged/ruby-pg/wiki/Home)
- [Sidekiq](http://sidekiq.org/) background jobs
  - [sidekiq-dynamic-throttle](https://github.com/bobbrez/sidekiq-dynamic-throttle)
- [Redis](http://redis.io/)
  - [redis-rails](https://github.com/redis-store/redis-rails)
    - [redis-store](https://github.com/redis-store/redis-store)
    - [redis-activesupport](https://github.com/redis-store/redis-activesupport)
    - [redis-actionpack](https://github.com/redis-store/redis-actionpack)
  - [redis-namespace](https://github.com/resque/redis-namespace)
- [Clockwork](https://github.com/tomykaira/clockwork) crons
- Rails App Templates
  - [rails_layout](https://github.com/RailsApps/rails_layout)
- Other
  - [Rails Assets](https://rails-assets.org/) include bower assets in rails apps
  - [Other rubygems](https://www.ruby-toolbox.com/) from the ruby toolbox
- Models
  - [PaperTrail](https://github.com/airblade/paper_trail)
- Views
  - [rails-assets.org](https://rails-assets.org) for other assets
  - [haml-rails](https://github.com/indirect/haml-rails)
    - [Haml](http://haml.info/)
    - [html2haml](https://github.com/haml/html2haml)
  - [sass-rails](https://github.com/rails/sass-rails)
    - [Sass](http://sass-lang.com/)
  - [coffee-rails](https://github.com/rails/coffee-rails)
    - [CoffeeScript](http://coffeescript.org/)
  - [jquery-rails](https://github.com/rails/jquery-rails) with [jQuery.turbolinks](https://github.com/kossnocorp/jquery.turbolinks)
    - [jQuery](https://jquery.com/)
    - [Turbolinks](https://github.com/rails/turbolinks/)
    - [jquery-cookie-rails](https://github.com/RyanScottLewis/jquery-cookie-rails)
      - [jQuery Cookies](https://plugins.jquery.com/cookie/)
  - [jquery-ui-rails](https://github.com/joliss/jquery-ui-rails)
    - [jQuery UI](https://jqueryui.com/)
  - [jBuilder](https://github.com/rails/jbuilder)
- Controllers
  - [Modernizr](https://github.com/russfrisch/modernizr-rails)
  - [SecureHeaders](https://github.com/twitter/secureheaders)
  - [Responders](https://github.com/plataformatec/responders)
  - [SSL Requirements](https://github.com/bartt/ssl_requirement)
- Debugging
  - [better_errors](https://github.com/charliesome/better_errors)
  - [binding_of_caller](https://github.com/quix/binding_of_caller)
  - [bullet](https://github.com/flyerhzm/bullet)
  - [hirb-unicode](https://github.com/miaout17/hirb-unicode) for hirb
  - [quiet_assets](https://github.com/evrone/quiet_assets)
  - [recipient_interceptor](https://github.com/croaky/recipient_interceptor)
  - [respec](https://github.com/oggy/respec)
  - [letter_opener](https://github.com/ryanb/letter_opener)
  - [pry](https://github.com/pry/pry)
    - [pry-rescue](https://github.com/ConradIrwin/pry-rescue)
    - [pry-stackknife](https://github.com/steakknife/pry-stackknife) pry-stack_explorer replacment, since pry-stack is unusable
    - [jazz_fingers](https://github.com/plribeiro3000/jazz_fingers)
      - [awesome_print](https://github.com/michaeldv/awesome_print)
      - [hirb](https://github.com/cldwalker/hirb)
      - [pry-coolline](https://github.com/pry/pry-coolline)
      - [pry-doc](https://github.com/pry/pry-doc)
      - [pry-git](https://github.com/pry/pry-git)
      - [pry-rails](https://github.com/rweng/pry-rails)
      - [pry-remote](https://github.com/Mon-Ouie/pry-remote)
    - [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
      - [byebug](https://github.com/deivid-rodriguez/byebug)
  - [spring](https://github.com/rails/spring)
    - [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec)
  - [web-console](https://github.com/rails/web-console)
- Documentation
  - [sdoc]()
  - [Yard]()
- Testing
  - [rspec-rails](https://github.com/rspec/rspec-rails) 
    - [RSpec](http://rspec.info/) Please read [betterspecs](http://betterspecs.org/)
    - [rspec-mocks](https://github.com/rspec/rspec-mocks)
    - [rspec-expectations](https://github.com/rspec/rspec-expectations)
  - [FactoryGirl](https://github.com/thoughtbot/factory_girl)
  - [Timecop](https://github.com/travisjeffery/timecop)
  - [should_not](https://github.com/should-not/should_not)
  - [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- Code Coverage
  - [metric_fu](https://github.com/metricfu/metric_fu/)
    - [cane](http://github.com/square/cane)
    - [churn](http://github.com/danmayer/churn)
    - [flog](https://github.com/seattlerb/flog)
    - [flay](https://github.com/seattlerb/flay)
    - [reek](https://github.com/troessner/reek)
    - [roodi](https://github.com/roodi/roodi)
    - [saikuro](https://github.com/metricfu/Saikuro)
    - [code_metrics](https://github.com/bf4/code_metrics)
    - [simplecov](https://github.com/colszowka/simplecov/)
    - [rails_best_practices](https://github.com/railsbp/rails_best_practices)

## Also helpfully installed (but not `require`d)

- [foreman_god](https://github.com/embarkmobile/foreman_god)
  - [foreman](https://github.com/ddollar/foreman)
  - [god](http://godrb.com/)
- [brakeman](http://brakemanscanner.org/) - rails security scanner
- [bundler-audit](https://github.com/rubysec/bundler-audit) - bundler gem dependencies scanner
- [rubocop](https://github.com/bbatsov/rubocop) - Ruby/Rails syntax style checker
- [taps-taps](https://shellycloud.com/blog/2013/10/easy-database-migration-using-taps) database import/exporter

## How it works

Everything in `lib/threads/*.rb` gets spawned in a `Thread.new` (and supervised!)

Sidekiq, since it's popular, is also included.  Sidekiq workers live at `lib/workers/*.rb` (Updated to work with Rails 4.2+ ActiveJob)

Clockwork, for timed jobs, is included as well `lib/clocks/*.rb`.  Further only one instance of clockwork is spun up, no matter how many rails app instances are launched (using SingletonProcess is a really bad ZooKeeper).

`lib/hacks/early/**/*.rb` are loaded early by `config/boot.rb` unless env `HACKS=n`

`lib/hacks/late/**/.rb` are loaded later by `config/environment.rb` unless env `HACKS=n`


## What's different

### UUID id's (primary keys)

Postgres UUID-typed model primary key `id`'s are enabled, but not default

**Notes**
- UUID ids breaks default scope
- Custom default scope based on `created_at` timestamp doesn't always work
- UUID's allows for opaque/information hiding
- Use the `create_table, :..., id: uuid do` way to specify UUID pk's
- Foreign keys declared in migrations probably wont work
- May want to define a custom `to_param` in the model or use something like `friendly_id`

~~Per view stylesheets and javascripts are not included in every view.  Instead, per-view assets are loaded after corresponding application.js and application.css.   This is more efficient to first page load as only the minimal assets are loaded.~~ This could cause configuration issues and noobie confusion, so it's dropped.

## Easy setup

    git clone https://github.com/steakknife/rails_plus_hacks_and_threads yournewproject
    cd yournewproject
    bin/setup && ./Procfile.god

## Requirements

- ruby 2.2.0
- postgres
- redis
- rake
- bundler

## Configuration

Can be set externally (such as heroku) or locally in config/application.yml

### Standard

- `RAILS_ENV` # defaults to development
- `PORT` # defaults to 3000 without foreman/foreman_god, 5000 with
- `DATABASE_URL`
- `RAILS_SERVE_STATIC_FILES` # defaults: heroku: true, not heroku: false
- `SECRET_KEY_BASE` # must always be set to 30+ characters in production

### Provided by this template

- General configuration
  - `RAILS_ASSET_HOST`
  - `RAILS_FORCE_SSL` # only
  - `RAILS_ASSETS_VERSION` # default: 1.0
  - `RAILS_DEFAULT_LOCALE` # default: en (English)
  - `RAILS_LOG_LEVEL` # default: info
  - `RAILS_TIMEZONE` # in rails format, default: UTC
  - `RAILS_STATIC_CACHE_CONTROL`
  - `RAILS_X_SENDFILE_HEADER`
  - `REDIS_URL` # if redis is used
  - `SIDEKIQ_JOB_QUEUE_REDIS_NAMESPACE` # namespace used by Sidekiq for this app (default: sidekiq_myapp)
- Puma
  - `PUMA_MIN_THREADS` # default: 0
  - `PUMA_MAX_THREADS` # default: 16
  - `PUMA_WORKERS` # default: no. of processors
  - `PUMA_CONTROL_ENDPOINT`
  - `PUMA_CONTROL_ENDPOINT_AUTH_TOKEN` # auth_token
  - `PUMA_CONTROL_ENDPOINT_NO_AUTH_TOKEN`
  - `PUMA_LOADED` # set by config/puma.rb
- ActiveRecord
  - `AR_DB_DEAD_CONN_TIMEOUT` # dead_connection_timeout
  - `AR_DB_REAP_FREQ` # reaping_frequency
  - `AR_DB_POOL` # pool
- Testing
  - `SIMPLECOV` # set to enable simplecov during rspec
  - `START_THREADS` # set to n to disable, or y to force enable (default: foreman/foreman god: y, rails s: n)
  - `HACKS` # set to n to disable (will probably break the app)
  - `EMAIL_INTERCEPTOR_RECIPIENT` # email to redrect all outbound emails to

## Author

* Barry Allard

## Contribs

* Your name here

## License

MIT

## Security

### Verify integrity of signed commits

    git clone https://github.com/steakknife/rails_plus_hacks_and_threads
    cd rails_plus_hacks_and_threads
    gpg --recv-keys 0x14CAC196A122026C
    git verify-commit HEAD


### How this was created

    rails new MyApp --database=postgresql --skip-test-unit


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## 100% legitimately homeless tip-begging cup™  

Please support open source

 BTC: 19rFYN6yNpDaNBpAWKHzmeKAt7tiDPgdiP
 ![19rFYN6yNpDaNBpAWKHzmeKAt7tiDPgdiP](https://chart.googleapis.com/chart?cht=qr&chl=bitcoin%3A19rFYN6yNpDaNBpAWKHzmeKAt7tiDPgdiP&choe=UTF-8&chs=300x300)
 
 Coins can be purchased through [CoinMama](https://www.coinmama.com/)

### *rattle-rattle*
