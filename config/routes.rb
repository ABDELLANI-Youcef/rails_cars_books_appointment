Rails.application.routes.draw do
  resources :authentication, only: [:create]
  resources :users, only: [:create] do
    resources :appointments, only: [:index]
  end

  resources :cars do
    resources :appointments, only: [:create]
    resources :image_elements
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
