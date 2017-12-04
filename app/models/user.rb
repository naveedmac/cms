class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  
  validates :first_name, :last_name, presence: true
  belongs_to :school

  has_many :cohorts, dependent: :destroy
  has_many :courses, through: :cohorts

  def full_name
        "#{first_name} #{last_name}"
      end
end
