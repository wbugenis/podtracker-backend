class Podcast < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :episodes

    validates :title, uniqueness: true
    after_create :get_info

    #Gets podcast's RSS feed to be parsed on the frontend
    def get_feed
        Unirest.get(self.rss_feed)
    end
    
    #Populate podcast info not supplied by iTunes from its RSS feed
    def get_info
        URI.open(self.rss_feed) { |rss|
            feed = RSS::Parser.parse(rss)

            self.update(podcast_home_url: feed.channel.link)
            puts feed.channel.link
            if feed.channel.description
                self.update(description: feed.channel.description)
            else 
                self.update(description: feed.channel.itunes_summary)
            end
            
            self.update(podcast_img_url:feed.channel.itunes_image.href)
        }
    end

end
