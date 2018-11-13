Rails.application.routes.draw do
  resources :auctions
  resources :residences
  resources :users
  get '/auctions/:id', to: 'auctions#show'
end
