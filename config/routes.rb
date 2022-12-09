Rails.application.routes.draw do
  root "lr11c#input"
  # get "palindromes", to: "palindromes#index"
  get "/view", to: "lr11c#view" 
  get "/show", to: "lr11c#show" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end