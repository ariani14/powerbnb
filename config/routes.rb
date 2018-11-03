Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # get "/sign_in" => "welcome#index", as: "sign_in"
 # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
 # get "/sign_up" => "clearance/users#new", as: "sign_up"

 
root 'welcome#index'
get "/auth/:provider/callback" => "sessions#create_from_omniauth"

resources :users
end
