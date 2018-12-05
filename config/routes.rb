Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :players

  resources :plies do
    resources :comments, only: [:edit, :show, :new, :destroy]
  end

  resources :collections do
    resources :games, only: [:show]
  end

  get '/filtered/:id', to: 'collections#filtered', as: :filtered

  resources :games do
    collection do
      get "explore", to: "games#explore"
    end
  end
end
