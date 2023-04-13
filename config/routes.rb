Rails
  .application
  .routes
  .draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  mount PgHero::Engine, at: "pghero"
  ENV["PGHERO_USERNAME"] = "erosanin"
  ENV["PGHERO_PASSWORD"] = "UUsn9dcz!"

  get '/' => 'cities#address_city', :constraints => { :subdomain => /.+/ }
  root to: "main#index"

  # constraints subdomain: "ekaterinburg" do
  #   get "main#index" => "cities#address_city"
  # end

  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[index show]
      resources :booking, only: [:create]
      post "call_booking", action: :call_booking, controller: "booking"
    end
  end

  resource :admin, except: %i[edit new create] do
    member do
      get "cars"
      get "bookings"
      get "edit_booking"
      get "articles"
      get "new_article"
      get "edit_article"
      get "new_car"
      get "deliveries"
      get "new_delivery"
      get "edit_delivery"
      get "upload_photos"
      get "edit_car"
      get "copy_car"
      get "text_main"
      get "text_other"
      get "text_metatags"
      get "text_pages"
      get "cities"
      get "reviews" => "admins#reviews"
      get "translations"
      get "add_new_city"
      get "add_new_town"
      get "new_city" => "admins#new_city"
      get "new_town" => "admins#new_town"
      get "new_cities"
      get "new_towns"
    end
  end

  # scope "(:locale)", locale: /en|ru/, defaults: { locale: ''} do
  # scope "(:locale)", locale: /en|ru/ do
  localized do
    resources :cars, except: [:edit] do
      resources :images, only: %i[create destroy]

      # Class auto
      collection do
        get "economy"
        get "middle"
        get "minivans"
        get "cabrio"
        get "crossovers"
        get "business"
        get "commercial"
      end

      member { delete :remove_attachment }
      resources :car_reviews, only: %i[create new destroy approve] do
        member { post "/approve" => "car_reviews#approve" }
      end
    end

    resource :text

    get "conditions", action: :conditions, controller: "main"
    get "success", action: :success, controller: "bookings"

    get "arenda-avto-aeroport-hrabrovo",
        action: :aeroport,
        controller: "deliveries"
    get "arenda-avto-zelenogradsk",
        action: :zelenogradsk,
        controller: "deliveries"
    get "arenda-avto-svetlogorsk",
        action: :svetlogorsk,
        controller: "deliveries"
    get "arenda-avto-yantarnyi", action: :yantarnyi, controller: "deliveries"
    get "arenda-avto-baltyisk", action: :baltyisk, controller: "deliveries"
    get "arenda-avto-pionerskyi",
        action: :pionerskyi,
        controller: "deliveries"
    get "arenda-avto-chernyahovsk",
        action: :chernyahovsk,
        controller: "deliveries"

    get "arenda-avto-s-voditelem", action: :s_voditelem, controller: "main"
    get "car-sharing", action: :car_sharing, controller: "main"
    get "casko", action: :casko, controller: "main"
    get "corporativnym-clientam", action: :corporate, controller: "main"
    get "sales-system", action: :sales, controller: "main"
    get "payment-methods", action: :payment, controller: "main"
    get "partners", action: :partners, controller: "main"
    get "franchise", action: :franchise, controller: "main"
    get "transportnyi-autsorsing", action: :outsours, controller: "main"
    get "full-insurance", action: :full_insurance, controller: "main"

    resources :reviews, only: %i[create index destroy approve] do
      member { post "/approve" => "reviews#approve" }
    end

    resources :quick_bookings, only: [:create]
    resource :rating, only: %i[create update]

    resources :bookings, only: %i[create new destroy update] do
      member do
        post "/accept" => "bookings#accept"
        post "/rejection_few_days" => "bookings#rejection_few_days"
        post "/rejection_not_cars" => "bookings#rejection_not_cars"
        post "/toggle_rejection" => "bookings#toggle_rejection"
      end
    end

    resources :deliveries

    resources :prices, only: [:index]
    resources :contacts, only: %i[index create]
    resources :terms, only: [:index]
    resources :faqs, only: [:index]
    resources :abouts, only: [:index]
    resources :services, only: [:index]
    resources :articles
  end
  resources :cities do
    member do
      post "/activate" => "cities#activate"
      post "/deactivate" => "cities#deactivate"
    end
    resources :towns do
      member do
        post "/activate" => "towns#activate"
        post "/deactivate" => "towns#deactivate"
      end
    end
  end

  get "/russia", to: "main#index"
  get "/russia/:city_name", to: "cities#address_city"
  get "/russia/:city_name/:town_name", to: "towns#address_town"
end
