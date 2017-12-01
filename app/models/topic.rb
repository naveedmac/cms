class Topic < ApplicationRecord
  belongs_to :course
  has_many :material, dependent: :nullify
  mount_uploader :file_link, AvatarUploader
end
