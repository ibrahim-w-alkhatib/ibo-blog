Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check
end
