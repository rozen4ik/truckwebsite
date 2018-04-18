Rails.application.routes.draw do
  resources :orders
  resources :contact
  resources :about
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
