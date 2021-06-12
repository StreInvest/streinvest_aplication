Rails.application.routes.draw do
  root to: 'investiment#home'
  get '/investment/specific', action: 'show', controller: 'investiment' 
  resources :investiment

end
