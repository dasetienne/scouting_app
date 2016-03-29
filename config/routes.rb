Rails.application.routes.draw do

  resources :players
  resources :authors
  resources :skills
  
  root "players#index"
end
