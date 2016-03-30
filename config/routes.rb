Rails.application.routes.draw do

  resources :players
  resources :authors
  resources :skills
  resources :teams
  resources :leagues
  
  root "players#index"
end
