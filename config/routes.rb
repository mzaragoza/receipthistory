Receipthistory::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      resources :profile
      resources :items
      resources :users
      root 'dashboard#index'
    end
  end

  match 'ping'         => 'pages#ping',           as: :ping, via: :all
  root 'pages#index'
end
