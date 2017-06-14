class AddDontSendToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :do_not_send, :boolean, nil: false, default: false
  end
end
