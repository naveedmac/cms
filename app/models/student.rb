class Student < ApplicationRecord
  belongs_to :user

  # belongs_to :cohort
  has_many :cohorts, dependent: :destroy
  has_many :courses, through: :cohorts

  
end
