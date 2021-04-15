Rails.application.routes.draw do
  resources :queued_items
  resources :user_episodes
  resources :podcasts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/login", to: "users#login"
  get "/user/:id/subscriptions", to: "subscriptions#user_subscriptions"

  post "/search/info", to: "search#rssInfo"
  get "/search/:term", to: "search#search"
  
  get "/podcasts/:id/episodes", to: "podcasts#episodes"
  get "podcasts/:id/feed", to: "podcasts#feed"
  
  post "/subscriptions", to: "subscriptions#subscribe"
  delete "/subscriptions/:id", to:"subscriptions#destroy"

  get "/userepisodes/:userid/:podcastid", to: "user_episodes#retrieve"
  
end
