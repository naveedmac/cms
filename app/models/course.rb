class Course < ApplicationRecord
  belongs_to :user

  # belongs_to :cohort
  has_many :topics, dependent: :nullify

  has_many :cohorts, dependent: :destroy
  has_many :users, through: :cohorts

  validates(:title, {
    presence: {message: 'must be provided'},
    uniqueness: true,
    length: {minimum: 5, maximum: 79}
  })

validates(:description, {
    presence: true,
    length: {minimum: 5, maximum: 2000}
  })

validates(:start_date,  {
    presence: {message: 'must be provided'}

  })
validates(:end_date, {
      presence: {message: 'must be provided'},

    })
#
# validate :happened_at_is_valid_datetime
#
#   def happened_at_is_valid_datetime
#     errors.add(:happened_at, 'must be a valid datetime') if ((DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError)
#   end

end
