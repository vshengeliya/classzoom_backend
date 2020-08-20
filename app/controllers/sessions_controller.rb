class SessionsController < ApplicationController

    def create
      byebug
        user = Student
            .find_by(email: params["email"])
            .try(:authenticate, params["password"])
    
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
