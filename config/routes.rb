Rails.application.routes.draw do
  resources :categorynotes
  resources :categorytodos
  resources :categories
  resources :notes
  resources :to_do_items
  resources :days
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
