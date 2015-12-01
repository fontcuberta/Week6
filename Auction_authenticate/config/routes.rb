Rails.application.routes.draw do
  root to: 'users#home'

  get '/signup' => 'users#new'
  get '/profile' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :index, :create, :destroy] do
    resources :products, only: [:index, :show, :new, :create, :destroy] do
      resources :bids, only: [:create]
    end
  end
end
