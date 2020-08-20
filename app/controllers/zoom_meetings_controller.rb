class ZoomMeetingsController < ApplicationController
    before_action :find_current_user, only: [:create]

    def create
        new_meeting = ZoomRunner.create_meeting        
        @current_user.update(current_zoom_meeting_url: new_meeting["join_url"], current_zoom_meeting_id: new_meeting["id"], current_zoom_meeting_password: new_meeting["password"], current_zoom_meeting_start_time: new_meeting["start_time"].to_datetime, current_zoom_meetin
            _duration: new_meeting["duration"] )
        
        # revisit how we'd like to render response after exploring some stretch features/goals
        render json: {status: 'meeting is ready'}
    end
    
    private

    def find_current_user
        #! confirm how params are structured when passed from frontend
        #? also, incorporate filtering by Model through route?
        @current_user = Student.find(params[:student][:id])
    end
end
