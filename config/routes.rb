Rails.application.routes.draw do
  devise_for :members
  root to: 'index#index'

  resources :events

  namespace :dashboard do
    root to: 'overview#show'
    resources :events
    resources :members
    resource :profile
  end
end
