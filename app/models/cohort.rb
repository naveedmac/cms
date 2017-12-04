class Cohort < ApplicationRecord
  # belongs_to :student
  belongs_to :user
  belongs_to :course

  # belongs_to :course
  # validates :course_id, uniqueness: { scope: :student_id }

  # attr_accessor :student_ids
    
  

end
