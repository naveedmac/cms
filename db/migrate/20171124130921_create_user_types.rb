class CreateUserTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_types do |t|
      t.string :title, limit: 30
      t.text :description

      t.timestamps
    end
  end
end
