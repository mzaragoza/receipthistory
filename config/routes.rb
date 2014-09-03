Receipthistory::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      resources :items
      resources :profile
      match 'store_members/:id'             => 'stores#members',           as: :store_members, via: :all
      match 'store_members/:id/remove/:user_id'  => 'stores#remove',            as: :store_members_remove, via: :all
      resources :stores
      resources :users
      root 'dashboard#index'
    end
  end

  match 'ping'         => 'pages#ping',           as: :ping, via: :all
  root 'pages#index'
end
