Rails.application.routes.draw do
  resources :quotes
  root to: 'quotes#index'
end
