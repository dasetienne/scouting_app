Rails.application.routes.draw do

  resources :players
  resources :authors
  
  root "players#index"
end
