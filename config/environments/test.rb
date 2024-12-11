# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  config.enable_reloading = false

  config.eager_load = ENV["CI"].present?

  config.public_file_server.headers = {"cache-control" => "public, max-age=3600"}

  config.consider_all_requests_local = true # show full error reports

  config.cache_store = :null_store

  config.action_dispatch.show_exceptions = :rescuable

  config.action_controller.raise_on_missing_callback_actions = true
  config.action_controller.allow_forgery_protection = false

  config.active_storage.service = :test

  config.action_mailer.delivery_method = :test

  config.action_mailer.default_url_options = {host: "example.com"}

  config.active_support.deprecation = :stderr
end
