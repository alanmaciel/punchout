Rails.application.routes.draw do

  get 'login' => 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:edit]

  root 'welcome#index'
end
