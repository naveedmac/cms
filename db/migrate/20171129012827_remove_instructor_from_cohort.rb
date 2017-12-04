class RemoveInstructorFromCohort < ActiveRecord::Migration[5.1]
  def change
    # remove_reference :cohorts, :instructor, foreign_key: true
  end
end
