Rails.application.routes.draw do
  resources :orders
  get 'contact/index'
  get 'about/index'
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
