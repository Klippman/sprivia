Rails.application.routes.draw do
  root 'users#index'

  get '/comments/new', :to => 'comments#new'
  get '/stats/index', :to => 'stats#index'
  get '/stats/show', :to => 'stats#show'
  get '/sprivia', :to => 'users#sprivia'
  get '/sign-in', :to => 'sessions#new'
  get '/sign-out', :to => 'sessions#destroy'
  post '/sign-in', :to => 'sessions#create'

  get '/posts/show', :to => 'posts#show'
  post '/posts/create', :to => 'posts#new'

  resources :users
  resources :posts
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
