class ChangeDefaultValuesOnStudent < ActiveRecord::Migration[5.0]
  def change
    change_column :students, :down_payment, :boolean, nil: false, default: false
    change_column :students, :financially_cleared, :boolean, nil: false, default: false
    change_column :students, :enrollment_agreement, :boolean, nil: false, default: false
    change_column :students, :transcript, :boolean, nil: false, default: false
    change_column :students, :yes_we_code, :boolean, nil: false, default: false

  end
end
