Rails.application.routes.draw do
  get 'trainers/index'

  get 'trainer/index'

  get 'trainer/index'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  resources :posts
  resources :trainers
  devise_for :users
  root 'home#index'
  post 'twilio/voice' => 'twilio#voice'
  devise_for :models
  get 'events/search' => 'events#search'
  get  'events/hello'  => 'events#hello'
  get 'profiles/:id' => 'profiles#show'
  get 'profiles/:id/new' => 'profiles#new'
  resources :events
  resources :users
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
