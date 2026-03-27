Rails.application.routes.draw do
  root "posts#index"
  resources :posts
  get "about", to: "pages#about"

  get "up" => "rails/health#show", as: :rails_health_check
end
