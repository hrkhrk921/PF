Rails.application.routes.draw do
  root to: 'home#top'
  get '/about'=>'home#about'

  #devise 会員
  devise_for :users, controllers: {
    sessions:      'user_devises/sessions',
    passwords:     'user_devises/passwords',
    registrations: 'user_devises/registrations'
  }
  #devise 管理者
  devise_for :admins, controllers: {
    sessions:      'admin_devises/sessions',
    passwords:     'admin_devises/passwords',
    registrations: 'admin_devises/registrations'
  }

  #マイページのルート
  resources :users,only: [:show,:update,:index]do
    collection do
        get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  get 'user/emend' => 'users#emend'
  #ブログのルート
  resources :blogs, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resource :blog_comments, only: [:create, :destroy]
  end
  #相談のルート
  resources :counsels, only: [:new, :index, :show, :edit, :create, :update, :destroy]do
    resource :counsel_comments, only: [:create, :destroy]
  end
  #インスタルート
  resources :photos, only: [:new, :index, :show, :edit, :create, :update, :destroy]do
  resource :favorites, only: [:create, :destroy]
  end

  #管理者のルート
  namespace :admin do
    get 'home' => 'home#top' #注文件数の合計を表示(管理者のみ)
    resources :categories, only: [:index, :edit, :create, :update]
  end
end
