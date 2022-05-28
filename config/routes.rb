Rails.application.routes.draw do
  root 'rooms#index'

  resources :rooms do
    get :post, on: :collection
    get :search, on: :collection
    get :reservations, on: :collection
  end

  resources :user_rooms

  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  resources :users do
    get :profile, on: :collection
    get :account, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
