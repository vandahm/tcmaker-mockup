Rails.application.routes.draw do
  devise_for :members
  root to: 'index#index'
  get 'blog',        to: 'interior#blog_archive'
  get 'blog/post', to: 'interior#blog_detail'
  get 'legalese',    to: 'index#legalese'

  resources :events

  namespace :dashboard do
    root to: 'overview#show'
    resources :events
    resources :members
    resource :profile
  end
end
