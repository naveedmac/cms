class DropInstructors < ActiveRecord::Migration[5.1]
  def up
    # drop_table :instructors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
