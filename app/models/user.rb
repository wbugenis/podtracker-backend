class User < ApplicationRecord
    has_many :subscriptions
    has_many :user_episodes
    has_many :queued_items
end
