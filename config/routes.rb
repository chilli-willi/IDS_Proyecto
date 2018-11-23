Rails.application.routes.draw do
 devise_for :users
  resources :auctions
  resources :residences
  resources :home
  #devise_for :users, controllers: {
  #      sessions: 'users/sessions'
  #    }
  post '/auctions/:id', to: 'auctions#show'
  post '/residences/:id', to: 'residences#show'
  root :to => "home#index"
end
