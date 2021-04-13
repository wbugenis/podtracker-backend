class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :runtime, :filepath, :filetype, :pubDate, :podcast_id
end
