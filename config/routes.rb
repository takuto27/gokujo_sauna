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
    resources :saunas, only: [:index, :show] do
      resource :bookmarks, only: [:show, :create, :destroy]
    end
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
    # resources :post_comments, only: [] do
    #   member do
    #     patch "hide/:comment_id" => "post_comments#hide", as: 'hide'
    #     patch :display
    #   end
    # end
    resources :posts, only: [:index,:show,:edit,:update] do
      member do
        get :customer
        patch :withdraw
      end
      
      patch "hide/:comment_id" => "post_comments#hide", as: 'hide'
      patch "display/:comment_id" => "post_comments#display", as: 'display'
    end
  end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
