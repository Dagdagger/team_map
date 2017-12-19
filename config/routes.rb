Rails.application.routes.draw do

  get 'coaches/index'

mount ActionCable.server => '/cable'
root 'home#index'
devise_for :users, :controllers => { registrations: 'registrations' }
devise_for :coaches, path: 'coaches', controllers:
{sessions: "coaches/sessions"}

authenticated :coach do
  resources :charges
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'coachprofiles/:id' => 'coachprofiles#show'
  get 'coachprofiles/:id/new' => 'coachprofiles#new'
  resources :coachprofiles
  resources :profiles
end

authenticated :user do
  resources :charges
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'events/search' => 'events#search'
  get 'events/hello'  => 'events#hello'
  get 'profiles/:id' => 'profiles#show'
  get 'profiles/:id/new' => 'profiles#new'
  get 'coachprofiles/index' => 'coachprofiles#index'
  get 'events/:id/join' => 'events#join'
  resources :events
  resources :users
  resources :profiles
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
