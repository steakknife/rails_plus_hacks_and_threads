#!/usr/bin/env bundle exec god -D -c
# vim: set filetype=ruby:
# mostly just for standalone production and dev, not needed on heroku
# https://gist.github.com/steakknife/9242235

require 'foreman_god'

## config
DEFAILT_RAILS_ENV = 'development'
IGNORE_SIGNALS = %w[HUP]
ERROR_SIGNALS = %w[INT TERM QUIT]
## config

IGNORE_SIGNALS.map { |ign| trap (ign) {} }
ERROR_SIGNALS.map do |err|
  trap err do
    $stderr.puts "\n! shutting down foreman_god"
    God.stop_all
    exit 1
  end
end

ForemanGod.watch File.dirname(__FILE__) do |w|
  w.name = 'foreman'
  w.start = "bundle exec foreman start -e .env.#{ENV['RAILS_ENV'] || DEFAULT_RAILS_ENV}"
  w.keepalive
end
