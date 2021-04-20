class UserEpisodesController < ApplicationController

    def create
        @user_episode = UserEpisode.create(user_episode_params)
        render json: @user_episode
    end

    def update
        @user_episode = UserEpisode.find(params[:id])
        @user_episode.update(user_episode_params)
        render json: @user_episode
    end

    def retrieve
        puts "retrieving"
        @user = User.find(params[:userid])
        @user_episodes = @user.user_episodes.where(podcast_id:params[:podcastid])
        render json: @user_episodes
    end

    private

    def user_episode_params
        params.permit(:user_id, :podcast_id, :title, :listened, :current_time)
    end
end
