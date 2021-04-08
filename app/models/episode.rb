class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :queued_items
  has_many :user_episodes
  validates :title, uniqueness: {scope: :podcast_id}
end
