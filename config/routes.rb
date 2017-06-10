Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'



  resources :users
  resources :games
  resources :players
  resources :ships

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  post "log_in" => 'sessions#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
