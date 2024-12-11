require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Janus
  class Application < Rails::Application
    config.load_defaults 8.1

    config.active_record.encryption.encrypt_fixtures = true

    config.autoload_lib(ignore: %w[assets tasks])
  end
end
