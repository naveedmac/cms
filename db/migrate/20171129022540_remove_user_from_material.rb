class RemoveUserFromMaterial < ActiveRecord::Migration[5.1]
  def change
    remove_reference :materials, :user, foreign_key: true
  end
end
