class User < ApplicationRecord
    has_many :subscriptions
    has_many :podcasts, through: :subscriptions
    has_many :user_episodes
    has_many :episodes, through: :user_episodes
    has_many :queued_items

    def subscribe(podcast)
        puts "hello"
        puts podcast
        @podcast = Podcast.find_by(rss_feed: podcast[:rss_feed])
        puts @podcast
        if !@podcast
            puts "not found"
            @podcast = Podcast.create(title:podcast[:title], rss_feed:podcast[:rss_feed], podcast_img_url:podcast[:podcast_img_url], description:podcast[:description], podcast_home_url:podcast[:podcast_home_url])
        end
        puts "after create"
        puts @podcast
        @subscription = self.subscriptions.create(podcast_id: @podcast[:id])
        return @podcast
    end

    private

    def podcast_params(podcast)
        params.permit(:title, :rss_feed, :podcast_img_url, :description, :podcast_home_url)
    end

end
