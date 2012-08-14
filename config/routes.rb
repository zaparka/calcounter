Calcounter::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users
  resources :activities, :only => :show
  get "runkeeper_activity/:activity_id" => "runkeeperactivities#show", :as => "runkeeper_activity"
  resources :subscribers, :only => :create
  root :to => 'users#index'
end
