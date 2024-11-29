Rails.application.routes.draw do
  root to: "drumracks#index"

  devise_for :users
  resources :users, only: [:show]


  resources :drumracks, only: [:index, :show, :update] do
    get :duplicate, on: :member
    member do
      get :soundbox
    end
  end

  get "new_soundbox", to: "drumracks#new_soundbox"
end

# faire une route qui fait un patch avec un json qui va représenter mon drumrack
# dans le controller je vais recevoir le json sous forme de params
# et je vais l'enrigistrer en db
