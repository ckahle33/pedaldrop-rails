require 'sidekiq/web'

Rails.application.routes.draw do
  root to: "products#index"
  resources :products
  get '/cart', to: 'carts#show'
  post '/cart', to: 'carts#update'
  delete '/cart', to: 'carts#destroy'

  # resources :carts, except: [:index, :new, :show]
  # resources :charges
  post 'charges', to: "charges#create"
  get 'thanks', to: "charges#thanks"

  # auth
  get '/login',                  to: 'sessions#new'
  post '/login',                 to: 'sessions#create'
  get '/logout',                 to: 'sessions#destroy'
  get '/signup',                 to: 'users#new'
  get '/confirm/:token',         to: 'users#confirm'
  get '/forgot',                 to: 'users#forgot', as: 'forgot'
  post '/forgot_password',       to: 'users#forgot_password', as: 'forgot_password'
  get '/reset/:token',           to: 'users#reset', as: 'reset'
  patch '/reset_password/:token', to: 'users#reset_password', as: 'reset_password'
  resources :users
  resources :dealers

  mount Sidekiq::Web => "/sidekiq"
end
