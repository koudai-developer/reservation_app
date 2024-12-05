Rails.application.routes.draw do

  devise_for :users

  get 'users/index'
  resources :users, only: [] do
    member do
      get :edit_profile
      patch :update_profile
    end
  end

  root "rooms#entrance"

  resources :rooms do
    member do
      get :registered
    end
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :destroy]
end
