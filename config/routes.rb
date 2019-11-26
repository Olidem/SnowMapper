Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Custom routes
  get '/resorts/:id/add_user', to: 'resorts#add_user', as: :resorts_add_user

  resources :countries, only: [:index, :show]

  resources :resorts, only: [:index, :show] do
    resources :groups, only: [:new, :create]
  end

  resources :groups, except: [:new, :create] do
    resources :memberships, only: [:new, :create]
  end

  resources :groups, only: [] do
    resources :messages, only: [:new, :create]
  end

  resources :messages, except: [:new, :create]

  resources :groups, only: [] do
    resources :meetings, only: [:new, :create]
  end

  resources :meetings, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
