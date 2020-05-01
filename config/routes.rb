Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root 'main#index'

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show]
      resources :booking, only: [:create]
    end
  end

  resources :cars, except: [:edit] do
    resources :images, :only => [:create, :destroy]
    member do
      delete :remove_attachment
    end
  end

  resource :text

  get 'conditions', action: :conditions, controller: 'main'
  get 'success', action: :success, controller: 'bookings'

  get 'arenda-avto-v-zelenogradske', action: :zelenogradsk, controller: 'deliveries'

  resource :admin, except: [:edit, :new, :create] do
    member do
      get 'cars'
      get 'bookings'
      get 'articles'
      get 'new_article'
      get 'edit_article'
      get 'new_car'
      get 'deliveries'
      get 'new_delivery'
      get 'edit_delivery'
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

  resources :quick_bookings, only: [:create]
  resource :rating, only: [:create, :update]

  resources :bookings, only: [:create, :show, :index, :new, :destroy] do
    member do
      post '/accept' => "bookings#accept"
    end
  end

  resources :deliveries

  resources :prices, only: [:index]
  resources :contacts, only: [:index, :create]
  resources :terms, only: [:index]
  resources :faqs, only: [:index]
  resources :abouts, only: [:index]
  resources :services, only: [:index]
  resources :articles
end
