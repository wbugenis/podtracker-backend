class Podcast < ApplicationRecord
    has_many :subscriptions
    has_many :episodes

    validates :title, uniqueness: true
    after_create :get_episodes
        
    def get_episodes
        URI.open(self.rss_feed) { |rss|
            feed = RSS::Parser.parse(rss)

            if feed.channel.description
                self.description = feed.channel.description
            else 
                self.description = feed.channel.itunes_summary
            end
            self.podcast_home_url=feed.channel.link
    
            if feed.channel.lastBuildDate
                self.last_rss_scan = feed.channel.lastBuildDate
            end

            feed.items.each{ |item|
                byebug
                puts item.title
                puts item.pubDate
                self.episodes.create(title:item.title, description:item.description, runtime:item.itunes_duration.content, published_date:item.pubDate
                )
            }

            if !feed.channel.lastBuildDate
                self.last_rss_scan = self.episodes.maximum("date")
            end
        }
    end

end
