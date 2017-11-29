class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, limit: 30
      t.text :description
      t.string :address
      t.string :city
      t.integer :province
      t.integer :country_id
      t.string :postal_code
      t.string :telephone
      t.string :website

      t.timestamps
    end
  end
end
