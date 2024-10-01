Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:new, :create]
  get '/urls/:short_id', to: 'urls#show', as: :url
  get '/:short_id', to: 'urls#redirect_to_url', as: :short
end