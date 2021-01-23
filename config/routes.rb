Rails.application.routes.draw do
  resources :doctors
  resources :patients
  devise_for :users, :skip => [:registrations]
  root 'welcome#index'
  namespace :patient do
    root :to => "patients#index"
  end
end
