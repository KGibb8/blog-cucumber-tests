Rails.application.routes.draw do

  devise_for :users

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :likes, only: [:create, :destroy]

  # get 'users/:id/posts_index' => 'users#posts', as: :user_posts

  root 'users#index'
end
