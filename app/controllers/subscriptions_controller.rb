class SubscriptionsController < ApplicationController

    def index
        @subscriptions = Subscription.all
        render json: @subscriptions
    end

    def create
        @user = User.find(params[:user][:id])
        @user.subscriptions.create(params[:podcast][:id])
    end

    def subscribe
        @user = User.find(params[:user][:id])
        @podcast = @user.subscribe(params[:podcast])
        render json: @podcast
    end 

    def user_subscriptions
        @user = User.find(params[:id])
        render json: @user.subscriptions
    end

    def destroy
        Subscription.find(params[:id]).destroy
        render json: {}
    end

end
