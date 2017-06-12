class CreateCodeChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :code_challenges do |t|
      t.string :newline_url
      t.string :description

      t.timestamps
    end
  end
end
