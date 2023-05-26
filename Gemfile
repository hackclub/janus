source "https://rubygems.org"

ruby File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip

gem "dotenv-rails", groups: [:development, :test]

gem "tzinfo-data" # don't rely on OS timezone data

gem "rails", github: "rails/rails"

# Drivers
gem "pg"
gem "redis"
gem "puma"
gem "image_processing"

# Assets
gem "sprockets-rails"
gem "sassc-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "simple_calendar"

# Security
gem "openid_connect"

gem "bootsnap", require: false

group :development, :test do
  gem "debug"

  # Code Critics
  gem "standard"
  gem "standard-rails"
end

group :development do
  gem "rack-mini-profiler"

  gem "web-console"
  gem "error_highlight"

  gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
