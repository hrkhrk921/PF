Rails.application.routes.draw do
  root to: 'home#top'
  get '/about' => 'home#about'

  # devise 会員
  devise_for :users, controllers: {
    sessions: 'user_devises/sessions',
    passwords: 'user_devises/passwords',
    registrations: 'user_devises/registrations'
  }
  # devise 管理者
  devise_for :admins, controllers: {
    sessions: 'admin_devises/sessions',
    passwords: 'admin_devises/passwords',
    registrations: 'admin_devises/registrations'
  }
  get 'users/confirm' => 'users#confirm'
  put 'users/hide' => 'users#hide'
  get 'users/emend' => 'users#emend'
  get 'users/blog' => 'users#blog'
  get 'users/photo' => 'users#photo'
  get 'users/counsel' => 'users#counsel'
  # マイページのルート
  resources :users, only: %i[show update index] do
    collection do
      get :favorites
    end
    resource :relationships, only: %i[create destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  # ブログのルート
  resources :blogs, only: %i[new index show edit create update destroy] do
    resource :blog_comments, only: %i[create destroy]
  end
  # 相談のルート
  resources :counsels, only: %i[new index show edit create update destroy] do
    resource :counsel_comments, only: %i[create destroy]
  end
  # インスタルート
  resources :photos, only: %i[new index show edit create update destroy] do
    resource :favorites, only: %i[create destroy]
  end

  get '/search' => 'searches#search', as: 'search'

  # 管理者のルート
  namespace :admin do
    get 'home' => 'home#top' # 注文件数の合計を表示(管理者のみ)
    resources :categories, only: %i[index edit create update]
    resources :users, only: %i[index edit show update]
  end
end
