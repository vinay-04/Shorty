Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:new, :create, :show]
  get '/:short_id', to: 'urls#redirect_to_url', as: :short
end