Rails.application.routes.draw do

  get 'login' => 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  get 'admin_menu' => 'welcome#admin_menu'
  get 'late_entries' => 'entries#late_entries'  
  get 'employees_absences' => 'entries#employees_absences'
  
  get 'employee_menu' => 'welcome#employee_menu'
  post 'working_hours' => 'entries#working_hours'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:edit]

  root 'welcome#index'
end
