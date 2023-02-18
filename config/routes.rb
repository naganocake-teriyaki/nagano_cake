Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


 scope module: :public do
  root to: 'homes#top'
  get "/about"=>"homes#about"
  resources :items, only: [:index, :show]
  resource :customers,only: [] do
    get "my_page"=>"customers#show"
    get "information/edit"=>"customers#edit"
    patch "information"=>"customers#update"
    get "confirm_withdraw"=>"customers#confirm_withdraw"
    patch "withdrawal"=>"customers#withdrawal"
    #get 'shipping_address', to: 'customers#shipping_address'
  end
  resources :cart_items, only: [:index, :update, :create, :destroy, :all_destroy] do
    collection do
      delete "all_destroy"=>"cart_items#all_destroy"
    end
  end

  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post "confirm"=>"orders#confirm"
      get "thanks"=>"orders#thanks"
      #get 'shipping_address', to: 'orders#shipping_address'
    end
  end
  resources :addresses, except: [:new, :show] do
    collection do
      #get 'shipping_address', to: 'addresses#shipping_address'
    end
  end
end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      get "orders" => "customers#orders"
    end
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
