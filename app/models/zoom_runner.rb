require 'uri'
require 'net/http'

module ZoomRunner
    ZOOM_API_VERSION = 'v2'
    BASE_URI = 'https://api.zoom.us/#{ZOOM_API_VERSION}/users'
    #PREFIX_URI = '/users'
    TARGET_USER_EP = 'me'
    MEETING_EP = '/meetings'

    # #TODO - enable dynamic behavior for various endpoints based on frontend user actions... let's narrow down to MVP scope of meeting actions
    # def self.url_builder
    #     URI(BASE_URI+TARGET_USER_EP)
    # end

#     Request User’s ZAK
# To request a User’s ZAK, send a GET request with a userId to /users/{userId]/token and specify type=zak in the body of the request. (If a type is not specified, the default response will be Zoom Token). .

# A User ID can either be a userID requested through the  or the user’s email address.
    def self.schedule_for_time
        arr = DateTime.now.end_of_minute.strftime.split('-')
        arr.pop
        return arr.join('-')
    end

    def self.create_meeting
        url = URI("https://api.zoom.us/v2/users/#{TARGET_USER_EP}/meetings")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request['content-type'] = 'application/json'
        request['authorization'] = "Bearer #{ZoomJwt::Auth.make_jwt}"
        zoom_body = {
            'topic': 'Project Zoom Demo',
            'type': 2,
            'start_time': self.schedule_for_time,
            'duration': 60,
            'password': 'Flatiron20',
            'settings': {
              'host_video': false,
              'participant_video': false,
              'cn_meeting': false,
              'in_meeting': false,
              'join_before_host': true,
              'mute_upon_entry': false,
              'use_pmi': false,
              'approval_type': 2,
              'audio': 'both',
              'auto_recording': 'local',
              'enforce_login': false
            }
        }

        # zoom_body = {
        #     'topic': 'string',
        #     'type': 'integer',
        #     'start_time': 'string [date-time]',
        #     'duration': 'integer',
        #     'schedule_for': 'string',
        #     'timezone': 'string',
        #     'password': 'string',
        #     'agenda': 'string',
        #     'recurrence': {
        #       'type': 'integer',
        #       'repeat_interval': 'integer',
        #       'weekly_days': 'string',
        #       'monthly_day': 'integer',
        #       'monthly_week': 'integer',
        #       'monthly_week_day': 'integer',
        #       'end_times': 'integer',
        #       'end_date_time': 'string [date-time]'
        #     },
        #     'settings': {
        #       'host_video': 'boolean',
        #       'participant_video': 'boolean',
        #       'cn_meeting': 'boolean',
        #       'in_meeting': 'boolean',
        #       'join_before_host': 'boolean',
        #       'mute_upon_entry': 'boolean',
        #       'watermark': 'boolean',
        #       'use_pmi': 'boolean',
        #       'approval_type': 'integer',
        #       'registration_type': 'integer',
        #       'audio': 'string',
        #       'auto_recording': 'string',
        #       'enforce_login': 'boolean',
        #       'enforce_login_domains': 'string',
        #       'alternative_hosts': 'string',
        #       'global_dial_in_countries': [
        #         'string'
        #       ],
        #       'registrants_email_notification': 'boolean'
        #     }
        #   }
        request.body = zoom_body.to_json
        

        response = http.request(request)
        
        return JSON.parse(response.read_body)
    end



    def self.response
        url = URI('https://api.zoom.us/v2/users/me/token?type=zak')

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request['authorization'] = 'Bearer #{ZoomJwt::Auth.make_jwt}'
        request['content-type'] = 'application/json'

        response = http.request(request)
        puts 'response.read_body'
        puts response.read_body
    end

end