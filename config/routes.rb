Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[show new create] do
    resources :rentals, only: :create
  end

  get '/about_us', to: "pages#about_us"
  get '/contact_us', to: "pages#contact_us"
  get '/terms_of_services', to: "pages#terms_of_services"
end
