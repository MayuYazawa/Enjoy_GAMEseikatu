Rails.application.routes.draw do


  namespace :admin do
    get 'registration/new'
    get 'registration/edit'
  end
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # 会員側のルーティング
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get "search" => "searches#search"
    # post "users/guest_sign_in", to: "sessions#guest_sign_in"

    resources :games, only: [:index, :show, :new, :update, :create, :destroy, :edit]
    resources :devices, only: [:index, :show, :new, :update, :create, :destroy, :edit]
    resources :users, only: [:show, :edit, :update, :quit, :withdraw] do
      collection do
        get 'quit'
        delete 'withdraw'
        get 'goods'
        get 'comment_goods'
      end
    end
    resources :game_goods, only: [:create, :destroy]
    resources :device_goods, only: [:create, :destroy]
    resources :game_comments, only: [:new, :create, :update, :edit, :index, :show, :destroy]
    resources :game_comment_goods, only: [:create, :destroy]
    resources :device_comments, only: [:new, :create, :update, :edit, :index, :show, :destroy]
    resources :device_comment_goods, only: [:create, :destroy]
  end

  # 管理者側のルーティング
  namespace :admin do
    get "" => "game_comments#index"

    resources :users, only: [:index, :show, :edit, :update, :withdraw, :return_member]
    resources :game_genres, only: [:index, :create, :edit, :update, :destroy]
    resources :device_genres, only: [:index, :create, :edit, :update, :destroy]
    resources :game_comments, only: [:index, :current_user_game_comment, :show, :update, :destroy]
    resources :device_comments, only: [:index, :current_user_device_comment, :show, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
