Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :orders
  resources :contact
  resources :about

  get 'api/orders/', to: 'api/orders#index'
  get 'api/orders/:id', to: 'api/orders#show'
  delete 'api/orders/:id', to: 'api/orders#destroy'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
