Rails.application.routes.draw do
  root   "homes#index"
  get    'homes/new'
  get    'sessions/new'
  get    "/signup", to: "users#new"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :tasks
end
