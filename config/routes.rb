Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:new, :create, :show]

  get 'users/:id/posts_index', to: 'users#posts', as: 'user_posts'

  root 'posts#index'
end
