Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :accounts

  resources :events

  resources :chat_rooms, only: [:new, :create, :show, :index]
end
