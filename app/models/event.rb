class Event < ApplicationRecord
  belongs_to :request, optional: true, default: -> { Current.request }

  belongs_to :subject, polymorphic: true
  belongs_to :creator, class_name: "User", default: -> { Current.user }, optional: true

  validates_presence_of :action
  serialize :details, coder: JSON
end
