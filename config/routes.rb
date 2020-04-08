Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  resources :cars, except: [:edit]

  resources :reviews, only: [:create, :index, :destroy, :approve] do
    member do
      post '/approve' => "reviews#approve"
    end
  end

  resources :bookings, only: [:create, :show, :index, :new] do
    resources :documents, only: [:create]
  end

  resources :prices, only: [:index]
  resources :contacts, only: [:index, :create]
  resources :terms, only: [:index]
  resources :faqs, only: [:index]
  resources :abouts, only: [:index]
  resources :services, only: [:index]
  resources :deliveries, only: [:index]
  resources :articles, only: [:index]
end
