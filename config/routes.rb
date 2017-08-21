Rails.application.routes.draw do
  resources :posts
  resources :trainers
  devise_for :users
  root 'home#index'
  post 'twilio/voice' => 'twilio#voice'
  devise_for :models
  get 'events/search' => 'events#search'
  get  'events/hello'  => 'events#hello'
  resources :events
  resources :users
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
