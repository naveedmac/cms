class Topic < ApplicationRecord
  belongs_to :course
  has_many :material, dependent: :nullify
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
  # validates :no_of_hours_required, presence: :true
  # validates :percentage_completed, presence: :true

# validates(:no_of_hours_required, numericality: {
#   presence: {message: 'must be provided'},
#     greater_than_or_equal_to: 0
#
#   })
# validates(:percentage_completed, numericality: {
#       greater_than_or_equal_to: 0,
#       less_than_or_equal_to:100
#     })
end
