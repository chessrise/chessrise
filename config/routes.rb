Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :players

  resources :plies, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:edit, :show, :new, :destroy, :create]
  end

  resources :collections do
    resources :games, only: [:show]
  end

  get '/filtered/:id', to: 'collections#filtered', as: :filtered
  get '/chessbox/:id', to: 'games#chessbox', as: :chessbox
  get '/:id/newgame', to: 'games#newgame', as: :newgame

  resources :games do
    collection do
      get "explore", to: "games#explore"
    end
  end
end


