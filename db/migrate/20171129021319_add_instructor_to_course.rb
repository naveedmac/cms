class AddInstructorToCourse < ActiveRecord::Migration[5.1]
  def change
    # add_reference :courses, :instructor, foreign_key: true
  end
end
