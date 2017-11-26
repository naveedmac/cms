class User < ApplicationRecord
  belongs_to :user_type
  belongs_to :school
end
