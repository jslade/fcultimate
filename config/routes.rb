Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/api' do
    resources :games, only: [:index, :show]
    resources :signups, only: [:create, :update, :destroy]

    get 'contents/:name', to: 'contents#show', constraints: { name: %r{[^/?]+} }
  end

  # This is needed for compatibility with react-router on the frontend, so none
  # of its routes get processed by rails, but rather everything gets processed
  # through the public/index_html
  get '*path', to: 'application#fallback', constraints: -> (request) do
    !request.xhr? && request.format.html?
  end
end
