class UserEpisodesController < ApplicationController

    def create
        @user_episode = UserEpisode.create(user_episode_params)
        render json: @user_episode
    end

    def update
        puts " ------"
        puts "*****"
        puts params
        puts "****"
        @user_episode = UserEpisode.find(params[:id])
        puts "***"
        puts @user_episode.title
        puts "***"
        puts params[:listened]
        puts "@@@@"
        if params[:current_time]
            @user_episode.update(current_time:params[:current_time])
        end
        if params[:listened].class == TrueClass || params[:listened].class == FalseClass
            puts params[:listened].class
            puts "************"
            puts params[:listened]
            @user_episode.update(listened:params[:listened])
        end
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
