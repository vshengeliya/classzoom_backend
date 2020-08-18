class AddZoomMeetingAttributesToTeachers < ActiveRecord::Migration[6.0]
  def change

    remove_column :teachers, :zoom_url, :string

    add_column :teachers, :current_zoom_meeting_url, :string
    add_column :teachers, :current_zoom_meeting_id, :string
    add_column :teachers, :current_zoom_meeting_password, :string
    add_column :teachers, :current_zoom_meeting_start_time, :datetime
    add_column :teachers, :current_zoom_meeting_duration, :integer

    add_column :teachers, :is_at_desk?, :boolean, null: false, default: true
  end
end
