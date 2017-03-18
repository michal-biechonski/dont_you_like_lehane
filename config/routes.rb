Rails.application.routes.draw do
  resources :books
  get 'books/index'

  get 'books/new'

  get 'books/create'

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

  resources :users, only: [:index, :show]

  root "pages#home"
  get "pages/about"
  get "pages/contact"
end
