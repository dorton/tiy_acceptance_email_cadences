class AddEmailBodyToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :email_body, :text
  end
end
