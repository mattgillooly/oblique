Oblique::Application.routes.draw do
  resources :quips, except: :show
  resource :settings, only: [:show, :create]

  root to: 'welcome#index'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
