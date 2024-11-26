Rails.application.routes.draw do
  root to: "drumracks#index"

  devise_for :users

  get "drumracks/play", to: "drumracks#play"
  resources :drumracks, only: [:index, :show]
end
