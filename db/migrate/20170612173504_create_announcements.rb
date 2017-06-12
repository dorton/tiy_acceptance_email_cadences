class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.date :date
      t.string :title
      t.string :location
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
