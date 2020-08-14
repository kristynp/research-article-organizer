Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  # Routes for Google authentication
  get '/auth/:provider/callback' => 'sessions#omnilogin'

  resources :research_goals do 
    resources :resources, only: [:new, :create, :index]
    resources :research_goal_notes, only: [:new, :create, :index]
  end 

  resources :users do
    resources :research_goals, only: [:new, :create, :index] 
  end
  
  resources :resources
  resources :journals
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
