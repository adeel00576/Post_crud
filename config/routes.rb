Rails.application.routes.draw do
 
  resources :posts do
    resources :comments
  end
  resources :tags
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'user/registrations', sessions: 'user/sessions', passwords: 'user/passwords'}

  devise_scope :user do
    authenticated :user do
      root 'home#new', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  get '/home' => 'home#new'
  put '/post/:id/like', to: 'posts#like', as: 'like'
  put '/post/:id/unlike', to: 'posts#unlike', as: 'unlike'
  get '/posts/:id/comments', to: 'comments#new'
  get '/search', to: 'home#new' 

  namespace :api do
    namespace :v1 do
      resources :microposts, only: [:index, :show, :create, :destroy]
    end
  end

end
