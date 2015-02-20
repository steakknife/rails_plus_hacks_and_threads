# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = ENV['RAILS_ASSETS_VERSION'] || '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Expire assets in 1 month
Rails.application.config.static_cache_control = ENV['RAILS_STATIC_CACHE_CONTROL'] || "public, max-age=#{1.month}"
