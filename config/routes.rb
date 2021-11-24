Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Account Creation
  post "/users", to: "users#create"

  #Login/token refresh
  post "/login", to: "users#login"
  get "/me", to: "users#me"

  #Search iTunes for podcasts
  get "/search/:term", to: "search#search"
  #Retrieve podcast info from RSS feed
  post "/search/info", to: "search#rssInfo"
  
  #Retrieve podcast's RSS feed link
  get "/podcasts/:id/feed", to: "podcasts#feed"
  
  #Retrieve all of user's podcast subscriptions
  get "/user/:id/subscriptions", to: "subscriptions#user_subscriptions"
  #Subscribe to podcast
  post "/subscriptions", to: "subscriptions#subscribe"
  #Unsubscribe from podcast
  delete "/subscriptions/:id", to:"subscriptions#destroy"

  #Retrive all of user's UserEpisodes
  get "/user/:userid/user_episodes", to: "user_episodes#user_index"
  #Create or update UserEpisode
  post "/user_episodes/save", to: "user_episodes#save"
  #Clear all of user's UserEpisodes
  get "/user_episodes/:userid/clear", to: "user_episodes#clear"

end
