class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :down_payment
      t.boolean :financially_cleared
      t.boolean :enrollment_agreement
      t.boolean :transcript
      t.boolean :yes_we_code
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
