Rails.application.routes.draw do
 devise_for :users
 resources :users, :only => [:show]
 resources :users do
  		member do
    		get 'be_premium'
        get 'apply_premium'
        get 'enable_premium'
        get 'disable_premium'
 		end
	end
 match '/users',   to: 'users#index',   via: 'get'
  resources :auctions
  resources :residences
  resources :home
  #devise_for :users, controllers: {
  #      sessions: 'users/sessions'
  #    }
  post '/auctions/:id', to: 'auctions#show'
  post '/auctions/:id', to: 'auctions#puja'
  post '/residences/:id', to: 'residences#show'
  root :to => "home#index"
end
