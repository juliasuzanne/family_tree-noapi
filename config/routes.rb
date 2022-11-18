Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "photos#index"
  resources :photos

  # Automatically generates the following routes
  # get "/photos" => "photos#index", as: "photos"
  # get "/photos/new" => "photos#new", as: "new_photo"
  # post "/photos" => "photos#create"
  # get "/photos/:id" => "photos#show", as: "photo"
  # get "/photos/:id/edit" => "photos#edit", as: "edit_photo"
  # patch "/photos/:id" => "photos#update"
  # delete "/photos/:id" => "photos#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
