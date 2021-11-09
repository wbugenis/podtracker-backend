class UserEpisodesController < ApplicationController
    before_action :authenticate, only: [:me]

    def create
        @user_episode = UserEpisode.create(user_episode_params)
        render json: @user_episode
    end

    def update
        @user_episode = UserEpisode.find(params[:id])

        if params[:current_time]
            @user_episode.update(current_time:params[:current_time])
        end

        if params[:listened].class == TrueClass || params[:listened].class == FalseClass
            @user_episode.update(listened:params[:listened])
        end
        
        render json: @user_episode
    end

    def save
        @user_episode = @user.user_episodes.where(title:params[:title])
        puts params[:title], @user_episode

        if @user_episode
            if params[:current_time]
                @user_episode.update(current_time:params[:current_time])
            end
    
            if params[:listened].class == TrueClass || params[:listened].class == FalseClass
                @user_episode.update(listened:params[:listened])
            end
        else
            @user_episode = UserEpisode.create(user_episode_params)
        end

        render json: @user_episode
    end


    def retrieve
        @user = User.find(params[:userid])
        @user_episodes = @user.user_episodes.where(podcast_id:params[:podcastid])
        render json: @user_episodes
    end

    def clear
        @user = User.find(parans[:userid])
        @user.user_episodes.delete_all
    end

    private

    def user_episode_params
        params.permit(:user_id, :podcast_id, :title, :listened, :current_time)
    end
end
