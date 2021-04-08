Rails.application.routes.draw do
  resources :queued_items
  resources :user_episodes
  resources :episodes
  resources :subscriptions
  resources :podcasts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/search/info", to: "search#rssInfo"
  get "/search/:term", to: "search#search"
  post "/login", to: "users#login"

  
end
