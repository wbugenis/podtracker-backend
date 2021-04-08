class SearchController < ApplicationController

    def search
        url = "https://itunes.apple.com/search?term=#{params[:term]}}&entity=podcast"
        response = Unirest.get(url)
        render json: response.body["results"]
    end

    def rssInfo

        URI.open(params[:rss]) { |rss|
            feed= RSS::Parser.parse(rss)
            if feed.channel.description
                description = feed.channel.description
            else 
                description = feed.channel.itunes_summary
            end
            
            info = {
                description:description,
                homepage:feed.channel.link
            }
            render json: info
        }
    end
        
end
