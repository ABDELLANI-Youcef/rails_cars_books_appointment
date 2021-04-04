Rails.application.routes.draw do
  resources :authentication, only: [:create]
  resources :users, only: [:create]
  resources :appointments, only: [:index, :create]

  resources :cars do
    resources :image_elements
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
