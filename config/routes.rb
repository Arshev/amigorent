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
    resources :car_reviews, only: [:create, :new, :destroy, :approve] do
      member do
        post '/approve' => "car_reviews#approve"
      end
    end
  end

  resource :text

  get 'conditions', action: :conditions, controller: 'main'
  get 'success', action: :success, controller: 'bookings'

  get 'arenda-avto-aeroport-hrabrovo', action: :aeroport, controller: 'deliveries'
  get 'arenda-avto-zelenogradsk', action: :zelenogradsk, controller: 'deliveries'
  get 'arenda-avto-svetlogorsk', action: :svetlogorsk, controller: 'deliveries'
  get 'arenda-avto-yantarnyi', action: :yantarnyi, controller: 'deliveries'
  get 'arenda-avto-baltyisk', action: :baltyisk, controller: 'deliveries'
  get 'arenda-avto-pionerskyi', action: :pionerskyi, controller: 'deliveries'
  get 'arenda-avto-chernyahovsk', action: :chernyahovsk, controller: 'deliveries'

  get 'arenda-avto-s-voditelem', action: :s_voditelem, controller: 'main'
  get 'car-sharing', action: :car_sharing, controller: 'main'
  get 'casko', action: :casko, controller: 'main'
  get 'corporativnym-clientam', action: :corporate, controller: 'main'
  get 'sales-system', action: :sales, controller: 'main'
  get 'payment-methods', action: :payment, controller: 'main'
  get 'transportnyi-autsorsing', action: :outsours, controller: 'main'
  get 'full-insurance', action: :full_insurance, controller: 'main'

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
      get 'text_pages'
      get 'cities'
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
