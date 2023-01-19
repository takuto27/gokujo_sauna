Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admins, skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get "search" => "searches#search"
    resources :posts
    resources :post_comments, only: [:create, :destroy]
    resources :saunas, only: [:index, :show]
    resource :bookmarks, only: [:create, :destroy]
    resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
    resources :customers, only: [:index,:show,:edit,:create,:update] do
      member do
        get :confirm
        patch :withdraw
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    get "search" => "searches#search"
    resources :saunas
    resources :customers, except: [:new,:create,:destroy]
    resources :posts, only: [:index,:show,:edit,:update] do
      member do
        get :customer
        patch :withdraw
      end
    end
    resources :order_details, only: [:update]
  end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
