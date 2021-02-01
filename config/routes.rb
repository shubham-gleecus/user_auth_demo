Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
  # # TODO: enable below for once app is ready for production
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/', to: 'home#index', as: :home
  resources :admins
  resources :supervisors
  resources :users
end
