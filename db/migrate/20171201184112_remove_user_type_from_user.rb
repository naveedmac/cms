class RemoveUserTypeFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :user_type, foreign_key: true
  end
end
