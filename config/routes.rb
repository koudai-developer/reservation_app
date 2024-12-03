Rails.application.routes.draw do

  get 'users/index'
  root "rooms#entrance"

  resources :rooms do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :destroy]
end
