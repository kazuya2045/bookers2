Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"
  resources :books, only: [:edit, :index, :show, :create, :destroy, :update]
  resources :users, only: [:edit, :index, :show, :update]
end
