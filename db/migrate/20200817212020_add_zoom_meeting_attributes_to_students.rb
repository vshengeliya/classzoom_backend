class AddZoomMeetingAttributesToStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :zoom_url, :string
    
    add_column :students, :current_zoom_meeting_url, :string
    add_column :students, :current_zoom_meeting_id, :string
    add_column :students, :current_zoom_meeting_password, :string
    add_column :students, :current_zoom_meeting_start_time, :datetime
    add_column :students, :current_zoom_meeting_duration, :integer

    add_column :students, :is_at_desk?, :boolean, null: false, default: true
  end
end
