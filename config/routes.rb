Rails.application.routes.draw do

  get 'login' => 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'
  get 'admin_menu' => 'welcome#admin_menu' 
  get 'late_entries' => 'entries#late_entries'  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:edit]

  root 'welcome#index'
end
