class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about_me, :string
    add_column :users, :address, :string
    add_column :users, :telephone, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
