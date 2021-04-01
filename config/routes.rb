Rails.application.routes.draw do
  # post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :authentication, only: [:create]
  resources :users, only: [:create]

  resources :cars do
    resources :appointments
    resources :image_elements
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
