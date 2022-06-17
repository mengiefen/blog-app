Rails.application.routes.draw do
  devise_for :users

  root to: "users#index"
  resources :users do
    resources :posts     
  end

  get '/users/:user_id/posts/:post_id/comment', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id/comment', to: 'comments#create' #
  get '/users/:user_id/posts/:post_id/like', to: 'likes#like'
  post '/users/:user_id/posts/:post_id/like', to: 'likes#like', as: 'new_like'
  delete '/users/:user_id/posts/:post_id/comment/:id', to: 'comments#destroy', as: "delete_comment"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 

  namespace :v1 do 
    resources :users do
      resources :posts , only: [:index, :show] do 
        resources :comments, only: [:index, :create]      
      end
    end
  end
end
