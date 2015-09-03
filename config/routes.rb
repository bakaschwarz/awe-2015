Rails.application.routes.draw do
  resources :sensors

  root 'static_pages#dashboard'

  get 'static_pages/dashboard'
  get 'static_pages/wetter_config'
  
  post 'weather_update/create' => 'weather_update#create'

  devise_for :users
end
