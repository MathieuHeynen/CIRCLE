Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[show new create] do
    resources :rentals, only: :create
  end
end
