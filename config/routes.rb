Rails.application.routes.draw do

  devise_for :users, 
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    unlocks: "users/unlocks",
    confirmations: "users/confirmations",
  },
  path_names: {
    sign_in: "login", sign_out: "logout", sign_up: "signup"
  },
  path: ""

  # devise_scope :user do
  #   get "signup", to: "users/registrations#new"
  #   get "login", to: "users/sessions#new"
  #   get "logout", to: "users/sessions#destroy"
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :comments, only: [:new, :create, :destroy]
    resources :readers, :future_readers, only: [:create, :destroy]
  end   
  resources :users, only: [:index, :show, :destroy] do
    resources :posts, except: [:index]
  end
  resources :posts, only: [:index]


  root "pages#home"
  get "pages/about"
  get "pages/contact"
end
