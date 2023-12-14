Rails.application.routes.draw do
  root to: 'customers#index'
  resources :customers
  delete "/customers/customerAndOrders/:id", to: "customers#destroy_with_orders"
  resources :orders
end
