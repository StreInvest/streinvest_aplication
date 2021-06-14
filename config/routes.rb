Rails.application.routes.draw do
  root to: 'home#home'
  get '/investment/specific', action: 'show', controller: 'investiment' 
  get '/investment/edition', action: 'edit', controller: 'investiment' 
  post '/investment/updated/', action: 'update', controller: 'investiment' 
  get '/investment/destroy', action: 'destroy', controller: 'investiment' 
  resources :investiment, only: [:index, :create, :new]

end
