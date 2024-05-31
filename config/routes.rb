Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[show new create] do
    resources :rentals, only: %i[create]
  end

  resources :rentals, only: %i[destroy]

  get '/about_us', to: "pages#about_us"
  get '/contact_us', to: "pages#contact_us"
  post '/contact_us', to: "pages#create"
  get '/terms_of_services', to: "pages#terms_of_services"

  get '/dashboard', to: 'dashboard#show'
end
