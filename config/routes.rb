Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :photographers, path: 'photographers', controllers: {
    sessions: "photographers/sessions",
    registrations: "photographers/registrations"
  }
  devise_scope :photographer do
    get '/photographers/sign_out' => 'devise/sessions#destroy'
  end
  root 'top#index'
  resources :top, only: :index
  resources :photographers, only: [:index,:show]
  resources :users do
    collection do
      get 'match'
      get 'search'
    end
  end
  resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
  resources :photographer_chat_rooms, only: [:index, :show]
  resources :user_chat_rooms, only: [:index, :show, :create]
  resources :reactions, only: :create
end
