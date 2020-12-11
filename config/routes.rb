Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#index'

  resource :following_articles, only: [:show]
  resource :following_achieved_articles, only: [:show]

  resources :articles do
    resource :like, only: [:show, :create, :destroy]
    resources :achieved_articles, only: [:index, :show, :new, :create, :update, :edit] do
      resources :comments, only: [:index, :new, :create, :update, :edit, :destroy]
      resource :thumbs_up, only: [:create, :destroy]
    end
  end

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do 
    resources :achieved_article_list, only: [:index]
    resource :follower, only: [:show]
    resource :following, only: [:show]

    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resources :favorites, only: [:index]
end
