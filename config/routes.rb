Rails.application.routes.draw do
  root "home_pages#index"

  resources :users 
end
