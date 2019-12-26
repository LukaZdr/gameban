Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :projects, only: [:index, :show] do
    resources :sprints, only: [:new, :create]
  end
  root 'welcome#show'
end
