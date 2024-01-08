Rails.application.routes.draw do
  get 'sessions/new'
  get "/signup", to: 'users#new'
  #delete user by its id
  delete "users/:id", to: "users#destroy", as: :delete_user
  root "static_pages#home"
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  #show all registered users
  #get '/users', to: 'users#index'
  #add REST resources for users
  resources :users
  #handling sessions
  get '/login', to: 'sessions#new' #login page
  post 'login', to: 'sessions#create' #create the session
  #delete the session
  delete '/logout', to: 'sessions#destroy' #delete the session
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  #root "application#hello"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :account_activations, only: [:edit]
end
