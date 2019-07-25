Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do 
    get 'artists' => 'artists#index'
    get 'artists/:id' => 'artists#show'
    get 'songs' => 'songs#index'
    get 'songs/:id' => 'songs#show'
    post 'liked-songs' => 'liked_songs#create'
    post 'users' => 'users#create'
    get 'users' => 'users#index'
  end
end
