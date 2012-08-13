Druthers::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :discussions do
    resources :solutions, only: [:create, :show] do
    end

  end
  
  resources :solutions, only: [] do
    resources :comments, only: [:create]
  end
end
