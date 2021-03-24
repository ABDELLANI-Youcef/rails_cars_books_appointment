Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  resources :cars do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
