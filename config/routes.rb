Rails.application.routes.draw do

mount ActionCable.server => '/cable'
root 'home#index'
devise_for :users
devise_for :coaches, path: 'coaches', controllers:
{sessions: "coaches/sessions"}

authenticated :user do
  resources :charges
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'events/search' => 'events#search'
  get  'events/hello'  => 'events#hello'
  get 'profiles/:id' => 'profiles#show'
  get 'profiles/:id/new' => 'profiles#new'
  resources :events
  resources :users
  resources :profiles
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
