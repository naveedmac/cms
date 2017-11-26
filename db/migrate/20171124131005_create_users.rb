class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 30
      t.string :password_digest
      t.text :secret_question_1
      t.string :answer_1_digest
      t.text :secret_question_2
      t.string :answer_2_digest
      t.references :user_type, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
