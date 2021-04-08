class PodcastsController < ApplicationController
    
    def create
        @podcast = Podcast.create(podcast_params)
        render json: @podcast
    end

    private

    def podcast_params 
        params.permit(:title, :rss_feed, :description, :podcast_img_url, :podcast_home_url)
    end

end
