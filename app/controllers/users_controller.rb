class UsersController < ApplicationController
    
    def login
        @user = User.find_by(params:[username])
        if @user.password == params[:password]
            render json: @user
        else
            render json: ["Username or password incorrect"]
        end
    end

end
