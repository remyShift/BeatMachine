Rails.application.routes.draw do
  root to: "drumracks#index"


  devise_for :users
  resources :users, only: [:show]


  resources :drumracks, only: [:index, :show] do
    resources :likes, only: [:create]
    member do
      get :soundbox
    end
  end
  resources :likes, only: [:destroy]
  get "new_soundbox", to: "drumracks#new_soundbox"

end
