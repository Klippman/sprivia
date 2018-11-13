Rails.application.routes.draw do
  root 'users#index'

  get 'users/index'
  get 'comments/index'
  get 'stats/index'
  get 'stats/show'
  get '/sprivia' => 'users#sprivia'
  get '/sign-in' => 'sessions#new'
  get '/sign-out' => 'sessions#destroy'
  post '/sign-in' => 'sessions#create'

  get 'posts/show' => 'posts#show'
  post '/posts' => 'posts#new'

  resources :users
  resources :posts
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
