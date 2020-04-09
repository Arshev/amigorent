Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root 'main#index'

  resources :cars, except: [:edit]

  resource :admin, except: [:edit, :new, :create] do
    member do
      get 'cars'
      get 'new_car'
      get 'upload_photos'
      get 'edit_car'
      get 'text_main'
      get 'text_other'
      get 'text_metatags'
    end
  end

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
