Rails.application.routes.draw do
  root :to => 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :accounts

  resources :events

  resources :accounts

end
