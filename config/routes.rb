Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]

  get 'users/:id/posts_index' => 'users#posts', as: :user_posts

  root 'posts#index'
end
