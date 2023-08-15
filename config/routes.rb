Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #delete 'admin/circuit_tracks/:id' => 'circuit_tracks#destroy'
  #delete 'admin/categories/:id' => 'categories#destroy'
  get 'posts/new/:category' => 'posts#new'
  namespace :admin do
    resources :posts
    resources :track_events
    resources :users
    resources :mycars
    resources :homes
    resources :parts
    resources :circuit_tracks
    resources :categories
  end
  
  
  scope module: :public do
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :track_events do
      patch 'update_deadline_event', on: :member
    end
    
    patch 'track_events/:id/update_deadline_event', to: 'public/track_events#update_deadline_event', as: 'update_deadline_event'
    resources :users do
      resources :my_best_times
      member do
        post 'follow', to: 'users#follow', as: 'follow'
        post 'unfollow', to: 'users#unfollow', as: 'unfollow'
      end
    end
    resources :follows, only: [:create, :destroy]
    resources :mycars
    resources :homes
    resources :parts
    resources :circuit_tracks
    resources :categories
    resources :events do
      patch 'update_deadline', on: :member
    end

  end 
  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
  get 'no_signin' => 'public/homes#no_signin'
  
  
end