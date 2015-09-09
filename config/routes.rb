Rails.application.routes.draw do
  resources :sensors
  resources :stations
  resources :users

  
  patch 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}
  put 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}
  


  root 'static_pages#dashboard'

  get 'static_pages/dashboard'
  get 'static_pages/dashboard_basic'
  get 'static_pages/wetter_config'
  get 'static_pages/line_chart'
  get 'static_pages/test'

  post 'static_pages/reload_dashboard' => 'static_pages#reload_dashboard'
  
  post 'weather_update/create' => 'weather_update#create'

  patch 'static_pages/update_defaults' => 'users#update'

  devise_for :users
end
