Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :collections do
    resources :games, only: [:show]
  end

  resources :games do
    collection do
      get "explore", to: "games#explore"
    end
  end
end
