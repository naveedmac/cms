class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title, limit: 20
      t.text :description
      t.integer :no_of_hours_required
      t.integer :percentage_completed
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
