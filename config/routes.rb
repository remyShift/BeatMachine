Rails.application.routes.draw do
  root to: "drumracks#index"
  devise_for :users
  resources :users, only: [:show]

  resources :drumracks, only: [:index, :show, :new, :save, :update] do
    resources :likes, only: [:create]
    member do
      get :soundbox
      patch :update_from_json
    end
  end

  resources :likes, only: [:destroy]

  get "new_soundbox", to: "drumracks#new_soundbox"

end

# faire une route qui fait un patch avec un json qui va représenter mon drumrack
# dans le controller je vais recevoir le json sous forme de params
# et je vais l'enrigistrer en db
