Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: :create
  resources :relationships, only: [:create, :destroy]
  resources :categories,only: :index
  resources :lessons do 
    resources :answers
  end
  namespace :administrator do
    resources :users, only: [:index, :update, :destroy]
    resources :categories do
      resources :words
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
