Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/api' do
    resources :games, only: [:index, :show]

    get 'contents/:name', to: 'contents#show', constraints: { name: %r{[^/?]+} }
  end
end
