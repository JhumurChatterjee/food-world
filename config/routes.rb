Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "home_pages#index"

  resources :users 
end
