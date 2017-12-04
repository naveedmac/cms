class RemoveInstructorFromCourse < ActiveRecord::Migration[5.1]
  def change
    # remove_reference :courses, :instructor, foreign_key: true
  end
end
