Rails.application.routes.draw do
  root to: 'index#index'

  resource :dashboard, only: :show
end
