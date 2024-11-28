Rails.application.routes.draw do
  root to: "drumracks#index"
 Useraccess

  devise_for :users
  resources :users, only: [:show]
  

  resources :drumracks, only: [:index, :show] do
    member do
      get :soundbox
    end
  end

  get "new_soundbox", to: "drumracks#new_soundbox"
end
