class CreateCohorts < ActiveRecord::Migration[5.1]
  def change
    create_table :cohorts do |t|
      t.string :material
      t.string :title, limit: 30
      t.text :description
      t.references :school, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
