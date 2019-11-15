Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'aucenticated_user_root' => 'users#index'
  end

  devise_for :photographers, path: 'photographers', controllers: {
    sessions: "photographers/sessions",
    registrations: "photographers/registrations"
  }
  devise_scope :photographer do
    get 'aucenticated_photographer_root' => 'photographer_chat_rooms#index'
  end

  root 'top#index'
  resources :top, only: :index
  resources :photographers, only: :show
  resources :users, only: [:index, :show] do
    collection do
       get 'match'
    end
  end
  resources :photographer_chat_rooms, only: :index
  resources :user_chat_rooms, only: :index
end
