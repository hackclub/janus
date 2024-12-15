source "https://rubygems.org"

gem "tzinfo-data" # don't rely on OS for timezone data

gem "rails", github: "rails/rails"

gem "puma"
gem "sqlite3"

# DB-backed adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Assets
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "openid_connect"

gem "bootsnap", require: false # reduces boot times through caching; required in config/boot.rb

# Deployments
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", require: "debug/prelude"

  # Code Critics
  gem "brakeman", require: false
  gem "standard", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
