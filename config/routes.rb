Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, paths: 'users'

  resources :users do
    resource :profile, except: [:new, :edit]
  end

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  # resources :profiles, only: [:create, :show, :update]
  resources :likes, only: [:create, :destroy]
  resources :tags, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # get 'users/:id/posts_index' => 'users#posts', as: :user_posts

  root 'users#index'
end
