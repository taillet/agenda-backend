Rails.application.routes.draw do
  resources :categoryevents
  resources :categorynotes
  resources :categorytodos
  resources :categories
  resources :notes
  resources :to_do_items
  resources :events
  resources :categoryevents
  resources :days
  resources :users
  post 'to_do_items/delete_all', to: "to_do_items#delete_all"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
