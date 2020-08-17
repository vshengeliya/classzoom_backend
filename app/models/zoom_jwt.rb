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
    end
end



