Dbcourse::Application.routes.draw do
  resources :airlines do
    resources :airplanes
  end
  resources :passengers
  resources :airports
  resources :airplane_models

  get "home/index"
  root to: 'home#index'
end
