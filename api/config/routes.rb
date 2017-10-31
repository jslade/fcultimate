Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/api' do
    resources :games, only: [:index, :show]
    resources :signups, only: [:create, :update, :destroy]

    get 'contents/:name', to: 'contents#show', constraints: { name: %r{[^/?]+} }
  end

  get '/contact', to: 'index#index'
  get '/about', to: 'index#index'
  get '/:game', to: 'index#index'
  root to: 'index#index'
end
