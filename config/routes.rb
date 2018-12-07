Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users
  get '/login', to: 'sessions#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
