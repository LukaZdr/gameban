Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :projects, only: [:index, :show] do
    resources :sprints do
      resources :tickets, only: [:create, :edit, :delete]
    end
  end
  root 'welcome#show'
end
