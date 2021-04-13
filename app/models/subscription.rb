class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :podcast
  
  validates :podcast_id, uniqueness: true

end
