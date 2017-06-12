class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.date :start_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
