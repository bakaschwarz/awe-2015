Rails.application.routes.draw do
  resources :sensors
  resources :stations

  root 'static_pages#dashboard'

  get 'static_pages/dashboard'
  get 'static_pages/dashboard_basic'
  get 'static_pages/wetter_config'
  get 'static_pages/line_chart'

  post 'weather_update/create' => 'weather_update#create'

  devise_for :users
end
