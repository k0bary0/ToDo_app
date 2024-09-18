Rails.application.routes.draw do
  get 'users/new'
  root "tasks#index"

  resources :users
  resources :tasks
end
