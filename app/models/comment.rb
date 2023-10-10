class Comment < ApplicationRecord
  include Eventable

  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :creator, class_name: "User", default: -> { Current.user }

  has_rich_text :content
  validates :content, presence: true

  broadcasts_to :commentable, target: :timeline
end
