Rails.application.routes.draw do
  devise_for :users
  root to: 'home#home'
  get '/investment/specific', action: 'show', controller: 'investiment'
  get '/investment/edition', action: 'edit', controller: 'investiment'
  post '/investment/updated/', action: 'update', controller: 'investiment'
  get '/investment/destroy', action: 'destroy', controller: 'investiment'
  get 'consortium/edition', action: 'edit', controller: 'consortium'
  post 'consortium/updated', action: 'update', controller: 'consortium'
  get 'consortium/destroy', action: 'destroy', controller: 'consortium'
  resources :investiment, only: %i[index create new]
  resources :consortium, only: %i[index create new]
end
