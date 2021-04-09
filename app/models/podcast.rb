class Podcast < ApplicationRecord
    has_many :subscriptions
    has_many :episodes

    validates :title, uniqueness: true
    after_create :get_episodes
        
    def get_episodes
        URI.open(self.rss_feed) { |rss|
            feed = RSS::Parser.parse(rss)

            self.update(podcast_home_url: feed.channel.link)

            if feed.channel.description
                self.update(description: feed.channel.description)
            else 
                self.update(description: feed.channel.itunes_summary)
            end
            
            if feed.channel.lastBuildDate
                lastUpdate = feed.channel.lastBuildDate
            else
                lastUpdate = feed.items[0].pubDate
            end
            
            
            if self.last_rss_scan < lastUpdate
                feed.items.each{ |item| 
                    puts item.title
                    puts item.pubDate
                    self.episodes.create(title:item.title, description:item.description, runtime:"#{item.itunes_duration.hour}h#{item.itunes_duration.minute}m#{item.itunes_duration.second}s", published_date:item.pubDate,
                        filepath: item.enclosure.url, filetype: item.enclosure.type
                    )
                }
            end

            if feed.channel.lastBuildDate
                puts "date block passed"
                self.update(last_rss_scan: feed.channel.lastBuildDate)
            else
                puts "date block failed"
                self.update(last_rss_scan: Episode.where(podcast_id: self.id).maximum("published_date"))
            end

        }
    end

end
