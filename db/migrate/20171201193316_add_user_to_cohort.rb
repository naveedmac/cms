class AddUserToCohort < ActiveRecord::Migration[5.1]
  def change
    add_reference :cohorts, :user, foreign_key: true
  end
end
