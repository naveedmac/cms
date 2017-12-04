class RemoveStudentFromCohort < ActiveRecord::Migration[5.1]
  def change
    # remove_reference :cohorts, :student, foreign_key: true
  end
end
