Rails.application.routes.draw do
 
  post 'listings/search' => 'listings#search'

  post 'listings/autocomplete' => 'listings#autocomplete'
  resources :listings

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  
  root 'welcome#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # get "/sign_in" => "welcome#index", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"

 
  resources :users
end
