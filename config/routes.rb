Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :projects, only: [:index, :show]
  resources :sprints, only: [:new]
  root 'welcome#show'
end
