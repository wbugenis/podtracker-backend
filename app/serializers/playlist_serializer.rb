class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :playlist
  belongs_to :user
end
