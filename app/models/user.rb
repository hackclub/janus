class User < ApplicationRecord
  include Authenticatable
  include Identifiable
  include Privileged
end
