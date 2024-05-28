Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[show new create]
  resources :rental, only: %i[show create]
end
