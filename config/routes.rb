Druthers::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  match 'votable/' => 'discussions#votable'
  match 'addsolution/' => 'solutions#create'

  resources :discussions do
    resources :solutions, only: [:create, :show]
  end

  resources :solutions do
    resources :comments, only: [:create, :new]
  end

  resources :comments, only: [:create, :new] do
    resources :comments, only: [:create, :new]
  end

  resources :rankings, only: [:new]
end
