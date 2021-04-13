class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :runtime, :filepath, :filetype, :pubDate, :podcast_id
  has_many :user_episodes
end
