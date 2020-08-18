class Teacher < ApplicationRecord
    include ActiveModel::Serializers::JSON

    has_many :teacher_students
    has_many :students, through: :teacher_students

    ## Helper Methods Below

    # Serialization Helper Method 
    def attributes
        { 'id' => nil, 'name' => nil, 'email' => nil, 'zoom_meeting_url' => nil, 'zoom_meeting_id' => nil, 'zoom_meeting_password' => nil, 'zoom_meeting_time' => nil, 'zoom_meeting_length' => nil }
    end

    # Frontend Helper Methods
    def zoom_meeting_url
        self.current_zoom_meeting_url
    end

    def zoom_meeting_id
        self.current_zoom_meeting_id
    end

    def zoom_meeting_password
        self.current_zoom_meeting_password
    end

    def zoom_meeting_time
        self.current_zoom_meeting_start_time
    end

    def zoom_meeting_length
        self.current_zoom_meeting_duration
    end
end
