class Course < ApplicationRecord
  belongs_to :user
  belongs_to :instructor
  # belongs_to :cohort
  has_many :topics, dependent: :nullify
  
  has_many :cohorts, dependent: :destroy
  has_many :students, through: :cohorts


end
