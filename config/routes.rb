Rails.application.routes.draw do

  post 'add_to_cart' => 'cart#add_to_cart'

  get 'view_cart' => 'cart#view_cart'

  get 'checkout' => 'cart#checkout'

  post 'delete_from_cart' => 'cart#delete_from_cart'

  post 'complete_order' => 'cart#complete_order'

  get 'provider_history' => 'bookings#provider_history'

  get 'recipient_history' => 'bookings#recipient_history'



  resources :categories
  resources :services
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'services#index'
end
