Rails.application.routes.draw do
  resources :users
  resources :doctors
  resources :patients
  devise_for :users, :skip => [:registrations]
  root 'welcome#index'
end
