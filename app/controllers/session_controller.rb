class SessionController < ApplicationController

    def create
        user = Student
            .find_by(email: params["students"]["email"])
            .try(:authenticate, params["students"]["password"])
    
        if user
          session[:user_id] = user.id
          render json: {
            status: :created,
            logged_in: true,
            user: user
          }
        else
          render json: { status: 401 }
        end
    end
end
