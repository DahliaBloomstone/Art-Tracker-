Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'


  resources :users
  resources :art_plans
  resources :art_projects, only: [:edit, :index, :show ]
  resources :art_schedules

  resources :art_plans do
    resources :art_schedules, only: [:new, :index, :create, :edit]
  end

  resources :art_projects do
    resources :art_schedules, only: [:new, :index, :create, :edit]
  end
end

