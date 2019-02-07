Rails.application.routes.draw do
  devise_for :members
  root to: 'index#index'

  get 'about-us', to: 'about#index'
  get '/about-us/history', to: 'about#history'
  get '/about-us/contact', to: 'about#contact'
  get '/about-us/governance', to: 'about#governance'
  get '/about-us/community', to: 'about#community'

  get 'membership', to: 'membership#index'
  get 'membership/join', to: 'membership#join'
  get 'membership/get-involved', to: 'membership#get_involved'
  get 'membership/rules', to: 'membership#rules'

  get 'community', to: 'community#index'
  get 'community/social', to: 'community#social'
  get 'community/volunteer', to: 'community#volunteer'

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
