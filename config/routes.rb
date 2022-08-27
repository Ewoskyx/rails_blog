Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, default: {format: :json} do
    namespace :v1,  default: {format: :json} do
      post 'login', to: 'authentication#authenticate'
      post 'register', to: 'users#create'
      resources :users do
        resources :posts, only: [:index, :show, :create] do
          resources :comments, only: [:index, :create]
          resources :likes, only: [:create]
        end
      end
    end
  end

  # Defines the root path route ("/")
end
