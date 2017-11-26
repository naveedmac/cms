class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, limit: 30
      t.string :middle_name, limit: 30
      t.string :last_name, limit: 30
      t.text :about_me
      t.string :telephone_no, limit: 12
      t.string :email, limit: 20
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
