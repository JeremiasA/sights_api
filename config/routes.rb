Rails.application.routes.draw do
  post 'users/register', do: 'users#register'
  post 'users/login', do: 'users#login'
  resources :cities
  resources :icons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
