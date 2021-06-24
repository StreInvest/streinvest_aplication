Rails.application.routes.draw do
  # devise_for :users # , except: %i[destroy]
  # get '/users/sign_out' => 'devise/sessions#destroy'

  root to: 'home#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

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
