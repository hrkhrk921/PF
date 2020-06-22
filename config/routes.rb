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

  #blogのルート
  resources :blogs, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
