class DropUserTypeTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :user_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
