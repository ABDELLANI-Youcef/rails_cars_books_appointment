Rails.application.routes.draw do
  resources :cars do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
