class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :runtime, :filepath, :filetype, :published_date, :podcast_id
end
