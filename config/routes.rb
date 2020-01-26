Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    resources :achievement do
      post "/redeem_extra_fuel" => "achievements#redeem_extra_fuel"
      post "/redeem_fast_travel" => "achievements#redeem_fast_travel"
      post "/redeem_gotta_go_fast" => "achievements#redeem_gotta_go_fast"
    end
  end
  resources :projects, only: [:index, :show] do
    resources :sprints do
      resources :tickets, only: [:create, :update, :delete] do
        post "/next" => "tickets#next"
        post "/previous" => "tickets#previous"
        resource :review, only: [:create]
      end
    end
  end
  root 'welcome#show'
end
