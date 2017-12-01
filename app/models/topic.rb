class Topic < ApplicationRecord
  belongs_to :course
  has_many :material, dependent: :nullify
end
