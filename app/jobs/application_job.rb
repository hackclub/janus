class ApplicationJob < ActiveJob::Base
  discard_on ActiveJob::DeserializationError # most likely a record not found
end
