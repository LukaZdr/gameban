Rails.application.routes.draw do
  devise_for :users
  root 'welcome#show'
end
