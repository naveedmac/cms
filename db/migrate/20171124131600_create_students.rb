class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, limit: 40
      t.string :middle_name, limit: 40
      t.string :last_name, limit: 40
      t.text :about_me
      t.string :telephone_no, limit: 20
      t.string :email, limit: 40
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
