Rails.application.routes.draw do
  devise_for :members
  root to: 'index#index'

  get 'about-us', to: 'about#index'
  get '/about-us/history', to: 'about#history'
  get '/about-us/contact', to: 'about#contact'

  get 'membership', to: 'membership#index'
  get 'membership/join', to: 'membership#join'
  get 'membership/rules', to: 'membership#rules'

  get 'classes', to: 'about#classes'

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
