Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#index'
  get '/archive_articles/' => 'archive_articles#edit'
  get '/archive_articles/:article_id/edit' => 'archive_articles#edit'
  put '/archive_articles/:article_id/' => 'archive_articles#update'

  resource :timeline, only: [:show]
  
  resources :articles do
    resource :like, only: [:show, :create, :destroy]
    resources :comments, only: [:index, :new, :create, :update, :edit, :destroy]
  end



  resource :profile, only: [:show, :edit, :update] 

  resources :accounts, only: [:show] do 
    resource :follower, only: [:show]
    resource :following, only: [:show]

    resources :follows, only: [:create] 
    resources :unfollows, only: [:create]
  end

  resources :favorites, only: [:index]
end
