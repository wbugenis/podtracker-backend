class Podcast < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :episodes

    validates :title, uniqueness: true
    after_create :get_info

    #Gets podcast's RSS feed to be parsed on the frontend
    def get_feed
        # Faraday.get(self.rss_feed).body.encode('iso-8859-1').encode('utf-8')
        URI.open(self.rss_feed){ |rss| 
            return RSS::Parser.parse(rss, false)
        }
    end
    
    #Populate podcast info not supplied by iTunes from its RSS feed
    def get_info
        URI.open(self.rss_feed) { |rss|
            feed = RSS::Parser.parse(rss, false)

            self.update(podcast_home_url: feed.channel.link)
            
            if feed.channel.description
                self.update(description: feed.channel.description)
            else 
                self.update(description: feed.channel.itunes_summary)
            end
            
            self.update(podcast_img_url:feed.channel.itunes_image.href)
        }
    end

end
