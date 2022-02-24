Rails.application.routes.draw do
  resources :users
  resources :rooms
  resources :user_rooms
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
