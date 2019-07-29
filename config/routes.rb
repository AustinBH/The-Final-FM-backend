Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do 
      get 'artists' => 'artists#index'
      get 'artists/:id' => 'artists#show'
      get 'events-by-artist' => 'ticketmaster#search_by_artist'
      get 'events-by-city' => 'ticketmaster#search_by_city'
      get 'songs' => 'songs#index'
      get 'songs/:id' => 'songs#show'
      post 'liked-songs' => 'liked_songs#create'
      delete 'liked-songs' => 'liked_songs#destroy'
      post 'users' => 'users#create'
      get 'users' => 'users#index'
      get 'users/:id' => 'users#show'
      
    end
  end
end
