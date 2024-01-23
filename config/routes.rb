Rails.application.routes.draw do
  resources :personal_religion_lists
  resources :personal_gender_lists
  resources :parent_education_lists
  resources :parent_job_lists
  resources :high_school_majors
  resources :major_lists
  # get 'personals/new'
  # get 'personals/update'
  # get 'personals/edit'
  # get 'personals/show'
  # get 'personals/create'
  get 'password_resets/new'
  get 'password_resets/edit'
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
  resources :users do #add following and followers action
    member do #member: get the user id
      get :following, :followers #get the following and followers,
      # url: /users/1/following and /users/1/followers,
      # named following_user_path(1) and followers_user_path(1)
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  #root "application#hello"
  # Defines the root path route ("/")
  # root "posts#index"
  #define as plural  if you have multiple data
  resources :account_activations,   only: [:edit]
  resources :password_resets,       only: [:edit, :new, :update, :create]
  resources :microposts,            only: [:create, :destroy]
  resources :relationships,         only: [:create, :destroy]
  resources :personals,             only: [:new, :create, :edit, :update, :show]
  resources :parents,               only: [:new, :create, :edit, :update, :show]
  resources :addresses,             only: [:new, :create, :edit, :update, :show]
  resources :languages,             only: [:new, :create, :edit, :update, :show]
  resources :achievements,          only: [:new, :create, :edit, :update, :show]
  resources :extras,                only: [:new, :create, :edit, :update, :show]
  resources :organizations,         only: [:new, :create, :edit, :update, :show]
  resources :sources,               only: [:new, :create, :edit, :update, :show]
  resources :majors,               only: [:new, :create, :edit, :update, :show]


end
