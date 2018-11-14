Rails.application.routes.draw do
  resources :auctions
  resources :residences
  resources :users
  resources :home
  post '/auctions/:id', to: 'auctions#show'
  post '/residences/:id', to: 'residences#show'
  root :to => "home#index"
end
