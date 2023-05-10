Rails.application.routes.draw do
  devise_for :users
  get "/users", to: "details#index"
  root "posts#index"
  resources :users do
    get "/profile_page", to: "users#profile_page", as: 'profile_page'
    resources :posts do
      resources :comments
    end
    resources :friendrequests
  end
end


