class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true, touch: true
  belongs_to :creator, class_name: "User", optional: true
  belongs_to :target, class_name: "User", optional: true

  def description
    if target.exists?
      "#{creator&.name} #{action} #{target.name}"
    else
      "#{creator&.name} #{action} this"
    end
  end
end
