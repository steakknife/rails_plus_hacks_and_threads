# README

Example app that runs all kinds of shit in threads.

## How it works

Everything in `lib/threads/*.rb` gets spawned in a `Thread.new` (and supervised!)

Sidekiq, since it's popular, is also included.

Clockwork, for timed jobs, is included as well.  Further only one instance of clockwork is spun up, no matter how many rails app instances are launched (using SingletonProcess is a really bad ZooKeeper).


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
