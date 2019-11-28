Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Custom routes
  get '/resorts/:id/add_user', to: 'resorts#add_user', as: :resorts_add_user
  get '/resorts/:id/sort_user_count', to: 'resorts#sort_user_count', as: :resorts_sort_user_count
  get '/resorts/:id/sort_group_created', to: 'resorts#sort_group_created', as: :resorts_sort_group_created
  get '/resorts/:id/sort_latest_message', to: 'resorts#sort_latest_message', as: :resorts_sort_latest_message
  get '/memberships/user_memberships', to: 'memberships#user_memberships'


  resources :countries, only: [:index, :show]

  resources :resorts, only: [:index, :show] do
    resources :groups, only: [:new, :create]
  end

  resources :groups, except: [:new, :create] do
    resources :memberships, only: [:new, :create]
  end

  resources :memberships, only: [:update, :destroy]

  resources :groups, only: [:show] do
    resources :messages, only: [:new, :create]
  end

  resources :messages, except: [:new, :create]

  resources :groups, only: [] do
    resources :meetings, only: [:new, :create]
    resources :membership_requests, only: [:create]
  end

  resources :meetings, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
