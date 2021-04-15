class UsersController < ApplicationController
    
    def create
        @user = User.create(user_params)
        render json: @user
    end

    def login
        @user = User.find_by(username: params[:username])
        # if @user.password == params[:password]
        if @user
            render json: @user
        else
            render json: false
        end
    end
    
    private

    def user_params
        params.permit(:username, :password)
    end
end
