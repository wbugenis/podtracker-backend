class UserEpisodesController < ApplicationController

    def create
        @user_episode = UserEpisode.create(user_episode_params)
        render json: @user_episode
    end

    def update
        @user_episode = UserEpisode.find(params[:id])
        @user_episode.update(listened: params[:listened])
        render json: @user_episode
    end
    
    private

    def user_episode_params
        params.permit(:user_id, :episode_id, :listened, :current_time)
    end
end
