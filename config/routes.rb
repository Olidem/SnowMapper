Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
