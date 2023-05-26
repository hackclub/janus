class User < ApplicationRecord
  include Authenticatable
  include Guest
  include Identifiable
  include Privileged
end
