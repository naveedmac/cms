class User < ApplicationRecord
  has_secure_password
  belongs_to :user_type
  belongs_to :school
end
