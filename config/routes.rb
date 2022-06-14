Rails.application.routes.draw do
    devise_for :users
    root to: "users#index"
    resources :users do
    resources :posts 
    end

#   # resources :comments, path: "/users/:user_id/posts/:post_id/comment", only: [:new, :create, :destroy]
#  resources :likes, path: "/users/::user_id/posts/:post_id/like", to: "likes#like"

  get '/users/:user_id/posts/:post_id/comment', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id/comment', to: 'comments#create' #
  get '/users/:user_id/posts/:post_id/like', to: 'likes#like'
  post '/users/:user_id/posts/:post_id/like', to: 'likes#like', as: 'new_like'


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
 
end
