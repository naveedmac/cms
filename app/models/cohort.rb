class Cohort < ApplicationRecord
  belongs_to :student
  belongs_to :school
  belongs_to :course
end
