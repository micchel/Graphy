Rails.application.routes.draw do
  root 'top#index'
  resources :top, only: :index
  resources :photographers do
    collection do
      get 'match'
    end
  end
  resources :users
  resources :photographer_chat_rooms
end
