Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index]

  get 'users/:id/followings' => 'users#followings', as: 'followings'
  get 'users/:id/followers' => 'users#followers',  as: 'followers'

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]


  get 'pv_ranking', to: 'imageposts#pv_ranking'
  
  # get 'posts' => 'posts#index'
  # get 'posts/new' => 'posts#new'
  # post 'posts' => 'posts#create'
  # get 'posts/:id' => 'posts#show',as: 'post'
  # patch 'posts/:id' => 'posts#update'
  # delete 'posts/:id' => 'posts#destroy'
  # get 'posts/:id/edit' => 'posts#edit', as:'edit_post'

  get 'posts/tv' => 'posts#tv'
  get 'posts/youtube' => 'posts#youtube'
  get 'posts/netflix' => 'posts#netflix'
  get 'posts/amzonprime' => 'posts#amazonprime'
  get 'posts/hulu' => 'posts#hulu'
  get 'posts/dazn' => 'posts#dazn'
  get 'posts/other' => 'posts#other'

  get 'posts/hello' => 'posts#hello'

  resources :posts


  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :relationships, only: [:create, :destroy]


  resources :posts do
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create]
  end

end
