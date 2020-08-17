class AddZoomMeetingAttributesToStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :zoom_url
    
    add_column :students, :current_zoom_meeting_url, :string
    add_column :students, :current_zoom_meeting_id, :string
    add_column :students, :current_zoom_meeting_password, :string
    add_column :students, :current_zoom_meeting_start_time, :string
    add_column :students, :current_zoom_meeting_duration, :integer
  end
end
