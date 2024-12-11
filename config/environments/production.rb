require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true

  config.assume_ssl = true
  config.force_ssl = true

  config.consider_all_requests_local = false # disable full error reports

  config.action_controller.perform_caching = true
  config.public_file_server.headers = {"cache-control" => "public, max-age=#{1.year.to_i}"}

  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.logger($stdout)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  config.active_storage.service = :local

  config.silence_healthcheck_path = "/up"

  config.active_support.report_deprecations = false

  config.cache_store = :solid_cache_store

  config.active_job.queue_adapter = :solid_queue

  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [:id]
end
