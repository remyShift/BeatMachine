Rails.application.routes.draw do
  root to: "drumracks#index"

  devise_for :users

  resources :drumracks, only: [:index, :show] do
    member do
      get :soundbox
    end
  end

  get "new_soundbox", to: "drumracks#new_soundbox"
end
