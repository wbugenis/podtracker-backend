class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :queued_items
  has_many :user_episodes
  has_many :users, through: :user_episodes
  validates :title, uniqueness: {scope: :podcast_id}

  def pubDate
    self.published_date.strftime("%m/%d/%y")
  end
end
