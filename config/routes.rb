Oblique::Application.routes.draw do
  resources :quips, only: [:index, :show, :create]
  resource :settings, only: [:show, :create]

  root to: 'welcome#index'
  match 'app', to: 'welcome#app', as: 'app'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
