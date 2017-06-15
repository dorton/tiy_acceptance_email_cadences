class AddCohortIdToSentEmail < ActiveRecord::Migration[5.0]
  def change
    add_reference :sent_emails, :cohort, foreign_key: true
  end
end
