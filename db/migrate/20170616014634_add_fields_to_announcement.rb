class AddFieldsToAnnouncement < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :description, :string
    add_column :announcements, :meetup, :boolean, default: false, null: false
    add_column :announcements, :host_group, :string
    add_column :announcements, :event_url, :string
    change_column :announcements, :date, :datetime
  end
end
