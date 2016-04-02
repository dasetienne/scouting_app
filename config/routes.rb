Rails.application.routes.draw do

  devise_for :users
  resources :players
  resources :authors
  resources :skills
  resources :teams
  resources :leagues
  
  
  root "players#index"
end
