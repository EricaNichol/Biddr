Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :auctions do
    resources :bids, only: [:new, :create]
  end

  root 'auctions#index'
end
