Rails.application.routes.draw do
  get 'details/index'
  devise_for :users
  get "/users", to: "details#index"
  root "posts#index"
  resources :users do
    resources :posts do
      resources :comments
    end
    resources :friendrequests
  end
end


