class RemoveSchoolFromCohort < ActiveRecord::Migration[5.1]
  def change
    remove_reference :cohorts, :school, foreign_key: true
  end
end
