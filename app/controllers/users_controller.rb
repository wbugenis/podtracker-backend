class UsersController < ApplicationController
    before_action :authenticate, only: [:me]

    def me
        render json: @user
    end

    def login
        @user = User.find_by(username: params[:username]) 
        if @user && @user.authenticate(params[:password])
            token = JWT.encode({ user_id: @user.id }, ENV["JWT_SECRET"], 'HS256')
            render json: { user: UserSerializer.new(@user), token: token }
        else 
            render json: {errors: ["Invalid username or password"]}, status: :unauthorized
        end
    end

    def create
        @user = User.create(user_params)
        
        if @user.valid?
            token = JWT.encode({ user_id: @user.id }, ENV["JWT_SECRET"], 'HS256')
            render json: { user: UserSerializer.new(@user), token: token }, status: :created
        else
            render json: { errors: @user.errors.full_messages}, status: :precondition_failed
        end

    end

    def update
        @user = User.find(params[:id])
        if @user.authenticate(params[:oldPassword])
            @user.update(password: params[:newPassword])
            if @user.valid?
                render json: @user
            else
                render json: {errors: @user.errors.full_messages}, status: :precondition_failed
            end
        else
            render json: {errors: ["Incorrect current password."]}, status: :unauthorized
        end
    end
    
    private

    def user_params
        params.permit(:username, :password)
    end
end
