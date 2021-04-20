class User < ApplicationRecord
    has_many :subscriptions
    has_many :podcasts, through: :subscriptions
    has_many :user_episodes
    has_many :episodes, through: :user_episodes
    has_many :queued_items
    
    belongs_to :playlist

    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true, length: {minimum: 3} 

    def subscribe(podcast)
        @podcast = Podcast.find_by(rss_feed: podcast[:rss_feed])
        
        if !@podcast
            puts "not found"
            @podcast = Podcast.create(title:podcast[:title], rss_feed:podcast[:rss_feed], podcast_img_url:podcast[:podcast_img_url], description:podcast[:description], podcast_home_url:podcast[:podcast_home_url])
        end

        @subscription = self.subscriptions.create(podcast_id: @podcast[:id])
        return @podcast
    end

    private

    def podcast_params(podcast)
        params.permit(:title, :rss_feed, :podcast_img_url, :description, :podcast_home_url)
    end

end
