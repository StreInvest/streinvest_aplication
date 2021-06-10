Rails.application.routes.draw do
  root to: 'investiment#home'
  get '/investment', action: 'index', controller: 'investiment' 
end
