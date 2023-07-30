Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
    

  root to: "situations#index"
  resources :situations

  resources :family_accounts,  only:[:new, :create]
end
