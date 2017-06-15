class CreateSentEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_emails do |t|
      t.string :body
      t.date :sent_date

      t.timestamps
    end
  end
end
