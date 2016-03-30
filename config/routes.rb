Rails.application.routes.draw do

  resources :players
  resources :authors
  resources :skills
  resources :teams
  
  root "players#index"
end
