require 'uri'
require 'net/http'

module ZoomRunner
    ZOOM_API_VERSION = "v2"
    BASE_URI = "https://api.zoom.us/#{ZOOM_API_VERSION}/users"
    #PREFIX_URI = "/users"
    TARGET_USER_EP = "/me"
    MEETING_EP = "/meetings"

    #TODO - enable dynamic behavior for various endpoints based on frontend user actions... let's narrow down to MVP scope of meeting actions
    def self.url_builder
        URI(BASE_URI+TARGET_USER_EP)
    end


    def self.response
        #url = URI("https://api.zoom.us/v2/users/me")
        url = ZoomRunner.url_builder

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["authorization"] = "Bearer #{ZoomJwt::Auth.make_jwt}"
        request["content-type"] = "application/json"

        response = http.request(request)
        puts "response.read_body"
        puts response.read_body
    end

end