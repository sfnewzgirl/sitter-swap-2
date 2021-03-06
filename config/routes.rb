Rails.application.routes.draw do

  get '/', to: 'welcome#home', as: 'root'

  # sessions
  get '/about', to: 'welcome#about', as: 'about'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # resources :family_people
  resources :families
  resources :people
  get '/people/person_search', to: 'people#search', as: 'person_search'
  # get '/people/:id/sitters/new', to: 'people#new_sitter', as: 'new_sitter'
  # post '/people/sitters', to: 'people#create_sitter', as: 'create_sitter'

  #search path to find families
  get '/family_people/search', to: 'family_people#search', as: 'family_people_search'

  #create new family person
  get '/family_people/new', to: 'family_people#new', as: 'new_family_person'
  post '/family_people', to: 'family_people#create', as: 'family_people_create'
  post '/family_people/sitters', to: 'family_people#sitter_create', as: 'family_people_sitter_create'

end
