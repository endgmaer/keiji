Rails.application.routes.draw do

  root to: "application#index"

  resources :posts, only: [:index, :show, :create, :destroy]
end
