Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
  devise_for :users, :skip => [:registrations]
  root 'welcome#index'
end
