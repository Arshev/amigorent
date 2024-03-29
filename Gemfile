source "https://rubygems.org"
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby "3.3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.1.4", ">= 6.0.3.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 5.5.0"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.4.3"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# My gems

gem "devise", ">= 4.7.1"
gem "devise-i18n", ">= 1.9.1"
gem "image_processing", "~> 1.2"
gem "mainsms_api", "~> 0.0.9"
gem "mailgun-ruby", "~> 1.2.0"
gem "sucker_punch", "~> 2.1.2"
gem "telegram-bot-ruby"
gem "recaptcha", "~> 5.2.1"
gem "will_paginate", "~> 3.3.0"
gem "ckeditor", "~> 5.1.0"
gem "meta-tags", "~> 2.16.0"
gem "sitemap_generator", "~> 6.1.0"
gem "whenever", "~> 1.0.0", require: false
gem "carrierwave", "~> 2.1.0"
gem "mini_magick", "~> 4.10.1"
gem "rails-i18n", "~> 6.0.0"
gem "route_translator", "~> 11.0.0"
gem "invisible_captcha", "~> 1.0.1"
gem "dalli", "~> 2.7.10"
gem "ransack", "~> 2.3.2"
gem "faraday", "~> 1.0.1"
gem "pghero", "~> 2.8.1"
gem "pg_query", ">= 0.9.0"
gem 'delayed_job_active_record', "~> 4.1.6"
gem 'daemons', "~> 1.4.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Use Capistrano for deployment
  gem "capistrano", "~> 3.14.1", require: false
  gem "capistrano-bundler", "~> 1.5.0", require: false
  gem "capistrano-rbenv", "~> 2.1.4", require: false
  gem "capistrano-rails", "~> 1.4.0", require: false
  gem "capistrano-passenger", "~> 0.2.0", require: false
  gem "capistrano-rails-console", "~> 2.3.0", require: false
  gem "capistrano-db-tasks", "~> 0.6", require: false
  gem "capistrano-npm", "~> 1.0.3", require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "ed25519", "~> 1.2"

gem "bcrypt_pbkdf", "~> 1.0"

gem "jquery-rails", "~> 4.4"

gem "rack-attack", "~> 6.5"
