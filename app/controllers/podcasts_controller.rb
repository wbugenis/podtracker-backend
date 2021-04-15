class PodcastsController < ApplicationController
    
    def index
        @podcasts = Podcast.all
        render json: @podcasts
    end
    
    def create
        @podcast = Podcast.create(podcast_params)
        render json: @podcast
    end

    def episodes
        @podcast = Podcast.find(params[:id])
        render json: @podcast.episodes
    end

    def feed
        @podcast = Podcast.find(params[:id])
        render json: @podcast.get_feed
    end
    
    private

    def podcast_params 
        params.permit(:title, :rss_feed, :description, :podcast_img_url, :podcast_home_url)
    end

end
