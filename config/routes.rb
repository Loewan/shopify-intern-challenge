Rails.application.routes.draw do
  root 'application#index'
  resources :images
end
