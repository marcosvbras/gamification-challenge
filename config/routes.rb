Rails.application.routes.draw do
  resources :scores
  root 'scores#index'
  get '/users/:uid/scores', to: 'scores#list_by_user'
end
