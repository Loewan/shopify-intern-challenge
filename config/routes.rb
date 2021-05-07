Rails.application.routes.draw do
  root 'pages#index'
  resources :images
end
