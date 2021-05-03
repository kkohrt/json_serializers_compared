Rails.application.routes.draw do
  resources :comments
  resources :phones
  resources :addresses
  resources :people
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
