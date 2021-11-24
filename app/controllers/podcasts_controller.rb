class PodcastsController < ApplicationController

    def feed
        @podcast = Podcast.find(params[:id])
        render json: @podcast.get_feed
    end
    
    private

    def podcast_params 
        params.permit(:title, :rss_feed, :description, :podcast_img_url, :podcast_home_url)
    end

end
