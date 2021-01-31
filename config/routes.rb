Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :appointments
  resources :doctors
  resources :patients
  devise_for :users, :skip => [:registrations]
  root 'welcome#index'
end
