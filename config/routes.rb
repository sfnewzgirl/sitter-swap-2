Rails.application.routes.draw do

  get '/', to: 'welcome#home', as: 'root'

  get '/about', to: 'welcome#about', as: "about"
  get '/login', to: 'sessions#new', as: "login"
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: "logout"

  # resources :family_people
  resources :families
  resources :people
end
