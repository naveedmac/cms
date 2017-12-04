class Material < ApplicationRecord

  belongs_to :topic
  mount_uploader :file_link, AvatarUploader

  validates(:title, {
    presence: {message: 'must be provided'},
    length: {minimum: 5, maximum: 79}
  })
  # validates :title, presence: :true
  # validates :description, presence: :true

validates(:description, {
  presence: {message: 'must be provided'},
    presence: true,
    length: {minimum: 5, maximum: 2000}
  })
  validates(:instructions, {
    presence: {message: 'must be provided'},
      presence: true,
      length: {minimum: 5, maximum: 2000}
    })
end
