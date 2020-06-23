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
  resources :users,only: [:show,:edit,:update,:index]
  #ブログのルート
  resources :blogs, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  #相談のルート
  resources :counsels, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  #インスタルート
  resources :photos, only: [:new, :index, :show, :edit, :create, :update, :destroy]

  #管理者のルート
  namespace :admin do
    get 'home' => 'home#top' #注文件数の合計を表示(管理者のみ)
    resources :categories, only: [:index, :edit, :create, :update]
  end
end
