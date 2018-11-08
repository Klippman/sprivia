Rails.application.routes.draw do
  root 'users#index'

  # get '/' => 'users#index'
  get 'comments/index'
  get 'sessions/new'
  get 'stats/index'
  get 'stats/show'
  get '/sign-in' => 'sessions#new'
  get '/sprivia' => 'users#sprivia'
  post '/sign-in' => 'sessions#create'

  get 'posts' => 'posts#index'
  post '/posts' => 'posts#new'

  resources :users
  resources :posts
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
