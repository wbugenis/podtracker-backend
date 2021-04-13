Rails.application.routes.draw do
  resources :queued_items
  resources :user_episodes
  resources :episodes
  resources :podcasts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/user/:id/subscriptions", to: "subscriptions#user_subscriptions"
  post "/search/info", to: "search#rssInfo"
  get "/search/:term", to: "search#search"

  post "/login", to: "users#login"
  get "/podcasts/:id/episodes", to: "podcasts#episodes"
  
  post "/subscriptions", to: "subscriptions#subscribe"
  delete "/subscriptions/:id", to:"subscriptions#destroy"

end
