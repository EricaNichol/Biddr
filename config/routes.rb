Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :auctions

  root 'auctions#index'
end
