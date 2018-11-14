Rails.application.routes.draw do
  resources :auctions
  resources :residences
  resources :users
  post '/auctions/:id', to: 'auctions#show'
  post '/residences/:id', to: 'residences#show'

end
