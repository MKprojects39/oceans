Rails.application.routes.draw do

  

  get 'comments/create'

  get 'comments/destroy'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  
  get '/help' , to:'static_pages#help'
  
  get '/signup',  to: 'users#new'
  
  get '/login', to: 'sessions#new'
 
  post '/login', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'
  
  
  
  
  get '/upload', to: 'articles#new'
  get 'users/:id/main', to: 'users#main'
  get 'users/:id/auter', to: 'users#auter'
  get 'users/:id/auter_f', to: 'users#auter_f'
  get 'users/:id/jaket_m', to: 'users#jaket_m'
  get 'users/:id/jaket_s', to: 'users#jaket_s'
  get 'users/:id/hoode_j', to: 'users#hoode_j'
  get 'users/:id/hoode_f', to: 'users#hoode_f'
  get 'users/:id/t_long', to: 'users#t_long'
  get 'users/:id/t_short', to: 'users#t_short'
  get 'users/:id/pant', to: 'users#pant'
  get 'users/:id/shose', to: 'users#shose'
  get "users/:id/likes" => "users#likes"
  get 'articles/:id/time' => "articles#time"

  
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
  resources :comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :articles do
    resources :likes, only: [:create, :destroy,:show]
    
  end
  
end

