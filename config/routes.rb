Rails.application.routes.draw do
  resources :source_mappings do
    member do
      get 'mapping'
    end
  end

  resources :db_connections do
    member do
      get 'tables'
    end
  end

  root 'db_connections#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
