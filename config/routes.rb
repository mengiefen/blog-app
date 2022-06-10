Rails.application.routes.draw do    
  root "users#index"
  resources :users do
    resources :posts 
  end

#   # resources :comments, path: "/users/:user_id/posts/:post_id/comment", only: [:new, :create, :destroy]
#  resources :likes, path: "/users/::user_id/posts/:post_id/like", to: "likes#like"

  get '/users/:user_id/posts/:post_id/comment', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id/comment', to: 'comments#create' #
  get '/users/:user_id/posts/:post_id/like', to: 'posts#show'
  post '/users/:user_id/posts/:post_id/like', to: 'likes#create', as: 'new_like'
 
end
