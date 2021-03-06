Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'

  root :to => 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }

  resources :accounts

  resources :events

  resources :chat_rooms, only: [:new, :create, :show, :index]
end
