Rails.application.routes.draw do
  resources :heroes
  resources :hero_jobs, only: [:index]
end
