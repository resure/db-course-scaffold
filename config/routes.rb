Dbcourse::Application.routes.draw do
  resources :airports

  resources :airplane_models

  get "home/index"
  root to: 'home#index'
end
