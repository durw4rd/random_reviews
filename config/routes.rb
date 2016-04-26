Rails.application.routes.draw do
  get 'products/Users'

  get 'products/Reviews'

  devise_for :users
  resources :products
  resources :users

end
