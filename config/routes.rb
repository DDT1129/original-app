Rails.application.routes.draw do
  
  #デバイスユーザーのコントローラーのデフォルトをいじってページ遷移を編集するために必要な記載
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
    

  root to: "situations#index"
  resources :situations

  resources :family_accounts
end
