Rails.application.routes.draw do
  get 'configs/update'

  resources :sensors
  resources :stations
  resources :configs

  
  patch 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}
  put 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}

  patch 'main_diagram_info' => 'sensors#update_main_diagram_id', defaults: {format: 'json'}
  put 'main_diagram_info' => 'sensors#update_main_diagram_id', defaults: {format: 'json'}


  root 'static_pages#dashboard'

  get 'static_pages/dashboard'
  get 'static_pages/dashboard_basic'
  get 'static_pages/wetter_config'
  get 'static_pages/line_chart'
  get 'static_pages/test'

  post 'static_pages/reload_dashboard' => 'static_pages#reload_dashboard'
  
  post 'weather_update/create' => 'weather_update#create'

  devise_for :users
end
