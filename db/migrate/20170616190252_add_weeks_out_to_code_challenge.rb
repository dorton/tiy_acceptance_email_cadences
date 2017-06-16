class AddWeeksOutToCodeChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :code_challenges, :weeks_out, :string
  end
end
