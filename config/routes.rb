Rails.application.routes.draw do
  root to: 'investiment#home'
  get '/investment', action: 'index', controller: 'investiment' 
  get '/investment/specific', action: 'show', controller: 'investiment' 
  post '/investment/new', action: 'create', controller: 'investiment'
end
