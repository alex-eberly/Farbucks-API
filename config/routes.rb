Rails.application.routes.draw do
  resources :payments
  resources :menu_items
  resources :menu_categories
  resources :order_items
  resources :orders
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'payment/:order_id/new' => 'payments#new', as: 
  :checkout

end
