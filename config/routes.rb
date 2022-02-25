Rails.application.routes.draw do
  root 'rooms#index'

  resources :rooms do
    get :post, on: :collection
  end

  resources :user_rooms

  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
