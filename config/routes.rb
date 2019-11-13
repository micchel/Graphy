Rails.application.routes.draw do
  root 'top#index'
  resources :top, only: :index
  resources :photographers
  resources :users do
    collection do
       get 'match'
    end
  end
  resources :photographer_chat_rooms
  resources :user_chat_rooms
end
