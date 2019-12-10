Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'authenticated_user_root' => 'users#index'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :photographers, path: 'photographers', controllers: {
    sessions: "photographers/sessions",
    registrations: "photographers/registrations"
  }
  devise_scope :photographer do
    get 'authenticated_photographer_root' => 'photographer_chat_rooms#index'
    get '/photographers/sign_out' => 'devise/sessions#destroy'
  end
  root 'top#index'
  resources :top, only: :index
  resources :photographers, only: :show
  resources :users, only: [:index, :show] do
    collection do
      get 'match'
    end
  end
  resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
  resources :photographer_chat_rooms, only: :index
  resources :user_chat_rooms, only: :index
end
