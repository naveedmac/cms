class Material < ApplicationRecord
  
  belongs_to :topic
  mount_uploader :file_link, AvatarUploader
end
