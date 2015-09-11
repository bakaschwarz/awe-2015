Rails.application.routes.draw do
  get 'api_tokens/update'

  get 'configs/update'

  resources :sensors
  resources :stations
  resources :configs
  resources :api_tokens

  
  patch 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}
  put 'dashboard_positions' => 'dashboard_positions#update', defaults: {format: 'json'}

  patch 'main_diagram_info' => 'sensors#update_main_diagram_id', defaults: {format: 'json'}
  put 'main_diagram_info' => 'sensors#update_main_diagram_id', defaults: {format: 'json'}


  root 'static_pages#dashboard'

  get 'static_pages/dashboard'
  get 'static_pages/wetter_config'

  post 'static_pages/reload_dashboard' => 'static_pages#reload_dashboard'
  post 'static_pages/reload_main_diagram' => 'static_pages#reload_main_diagram'

  
  
  post 'weather_update/create' => 'weather_update#create'

  devise_for :users
end
