Rails.application.routes.draw do
  root 'cars#index'
  get 'cars/create' => 'cars#create'
  get 'cars/accelerate' => 'cars#accelerate'
  get 'cars/brake' => 'cars#brake'
  get 'cars/light_switch' => 'cars#light_switch'
  get 'cars/parking_brake_switch' => 'cars#parking_brake_switch'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
