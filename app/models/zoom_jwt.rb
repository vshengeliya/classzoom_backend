require 'uri'
require 'net/http'
require 'jwt'

module ZoomJwt
    API_KEY = Rails.application.credentials.zoom_jwt[:api_key]
    SECRET_KEY = Rails.application.credentials.zoom_jwt[:api_secret]
   
    class Auth
        def self.make_jwt
            payload = {
                iss: API_KEY,
                exp: Time.now.to_i + 2
            }
            token = {
                "appKey": API_KEY
            }
            return JWT.encode(payload, SECRET_KEY, "HS256", {typ: "JWT"})
        end

        def self.response
            url = URI("https://api.zoom.us/v2/users/me")
            
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["authorization"] = "Bearer #{self.make_jwt}"
            request["content-type"] = "application/json"

            response = http.request(request)
            puts "response.read_body"
            puts response.read_body
        end
    end
end



