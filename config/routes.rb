Rails.application.routes.draw do


  get 'coaches/index'

 mount ActionCable.server => '/cable'
 root 'home#index'
 devise_for :users, :controllers => { registrations: 'registrations' }
 devise_for :coaches, path: 'coaches', controllers:
 {sessions: "coaches/sessions"}

 get '/conditions' => 'home#conditions'
 authenticated :coach do
  resources :charges
  get 'coachprofiles/:id' => 'coachprofiles#show'
  get 'coachprofiles/:id/new' => 'coachprofiles#new'
  resources :coachprofiles
  resources :profiles
end

authenticated :user do
  resources :charges
  resources :invites
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :instaconvos do
    resources :supamessages
  end
  resources :leagues
  resources :groups
  get 'groups/:id/join' => 'groups#join', as: 'groupjoin'
  get 'seecoachprofiles/:id' => 'coachprofiles#publicshow'
  get 'coachprofiles/index' => 'coachprofiles#index'
  resources :coachprofiles do
  member do
    put "like", to: "coachprofiles#upvote"
    put "dislike", to: "coachprofiles#downvote"
  end
end
  get 'profiles/:id' => 'profiles#show'
  get 'profiles/:id/achievements' => 'achievements#index', as: 'profile_achievements'
  get 'profiles/:id/achievements/new' => 'achievements#new', as: 'profile_achievements_new'
  post 'profiles/:id/achievements/create' => 'achievements#create'
  get 'profiles/:id/photos' => 'photos#index', as: 'profile_photos'
  get 'profiles/:id/photos/new' => 'photos#new', as: 'profile_photos_new'
  post 'profiles/:id/photos/create' => 'photos#create'
  get 'profiles/:id/new' => 'profiles#new'
  resources :profiles do
  member do
    put "like", to: "profiles#upvote"
    put "dislike", to: "profiles#downvote"
    put "follow", to: "profiles#follow"
    put "unfollow", to: "profiles#unfollow"
    get "followers/:id/followers", to: "profiles#followers", as: 'followers'
    get 'seeprofiles/:id' => 'profiles#publicshow', as: 'publicshow'
  end
end
  get 'events/:id/join' => 'events#join', as: 'join'
  get 'events/:id/attendees' =>  'events#attendees'
  resources :events
  resources :users
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
