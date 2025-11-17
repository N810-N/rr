Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]


  
  unauthenticated do
    root to: "blogs#index", as: :unauthenticated_root
  end
  resources :blogs

  authenticated :user do
    root to: "calendars#show", as: :authenticated_root
  end
  resources :sleep_checks, only: [:new, :create, :show]

end