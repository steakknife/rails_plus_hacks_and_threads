# README

Example app that runs all kinds of shit in threads.

## What's preconfigured

- Rails 4
- [HAML](https://github.com/indirect/haml-rails)
- [SASS](https://github.com/rails/sass-rails)
- [jQuery](https://github.com/rails/jquery-rails) with [jQuery.turbolinks](https://github.com/kossnocorp/jquery.turbolinks)
- [jQuery UI](https://github.com/joliss/jquery-ui-rails)
- [Modernizr](https://github.com/russfrisch/modernizr-rails)
- [pg](https://bitbucket.org/ged/ruby-pg/wiki/Home)
- [jQuery Cookies](https://github.com/RyanScottLewis/jquery-cookie-rails)
- [CoffeeScript](https://github.com/rails/coffee-rails)
- [rails-assets.org](https://rails-assets.org) for other assets
- [Sidekiq](http://sidekiq.org/)
- [Clockwork](https://github.com/tomykaira/clockwork)
- Testing
  - [RSpec](http://rspec.info/) Please read [betterspecs](http://betterspecs.org/)
  - [FactoryGirl](https://github.com/thoughtbot/factory_girl)
  - [RR](https://github.com/btakita/rr)
  - [Timecop](https://github.com/travisjeffery/timecop)
  - [should_not](https://github.com/should-not/should_not)
  - [recipient_interceptor](https://github.com/croaky/recipient_interceptor)
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

- [brakeman](http://brakemanscanner.org/) - rails security scanner
- [bundler-audit](https://github.com/rubysec/bundler-audit) - bundler gem dependencies scanner
- [rubocop](https://github.com/bbatsov/rubocop) - Ruby/Rails syntax style checker

## How it works

Everything in `lib/threads/*.rb` gets spawned in a `Thread.new` (and supervised!)

Sidekiq, since it's popular, is also included.  Sidekiq workers live at `lib/workers/*.rb`

Clockwork, for timed jobs, is included as well `lib/clocks/*.rb`.  Further only one instance of clockwork is spun up, no matter how many rails app instances are launched (using SingletonProcess is a really bad ZooKeeper).


`lib/hacks/early/**/*.rb` are loaded early by config/boot.rb unless env `HACKS=n`

`lib/hacks/late/**/.rb` are loaded later by config/environment.rb unless env `HACKS=n`


## What's different

Per view stylesheets and javascripts are not included in every view.

Instead, per-view assets are loaded after corresponding application.js and application.css

This is more efficient to first page load as only the minimal assets are loaded.

## Easy setup

    git clone https://github.com/steakknife/rails41rc_plus_hacks_and_threads
    cd rails41rc_plus_hacks_and_threads
    bundle exec rake db:setup
    foreman start

## Requirements

- ruby 2.1.1
- postgres
- rake
- bundler

## Configuration

Can be set externally (such as heroku) or locally in config/application.yml

### Standard

- RAILS_ENV # defaults to development
- PORT # defaults to 3000 without foreman, 5000 with
- DATABASE_URL

### Provided by this template

- START_THREADS # set to n to disable, or y to force enable 
- HACKS # set to n to disable (will probably break the app)
- EMAIL_INTERCEPTOR_RECIPIENT # email to redrect all outbound emails to
- PUMA_MIN_THREADS
- PUMA_MAX_THREADS
- PUMA_WORKERS # no. of processes
- PUMA_CONTROL_ENDPOINT
- PUMA_CONTROL_ENDPOINT_AUTH_TOKEN
- PUMA_CONTROL_ENDPOINT_NO_AUTH_TOKEN
- AR_DB_DEAD_CONN_TIMEOUT # dead_connection_timeout
- AR_DB_REAP_FREQ # reaping_frequency
- AR_DB_POOL # pool
- SIMPLECOV # set to enable simplecov during rspec
- RAILS_ASSET_HOST
- RAILS_FORCE_SSL
- RAILS_ASSETS_VERSION
- RAILS_DEFAULT_LOCALE
- RAILS_LOG_LEVEL
- REDIS_URL # if redis is used
- RAILS_TIMEZONE # in rails format
- RAILS_STATIC_CACHE_CONTROL
- SIDEKIQ_JOB_QUEUE_REDIS_NAMESPACE # namespace used by Sidekiq for this app (default: sidekiq_myapp)

## Author

* Barry Allard

## Contribs

* Your name here

## License

MIT

## Security

### Verify integrity of signed commits

    git clone https://github.com/steakknife/rails41rc_plus_hacks_and_threads
    cd rails41rc_plus_hacks_and_threads
    gpg --recv-keys 0x14CAC196A122026C
    git log --show-signature


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
