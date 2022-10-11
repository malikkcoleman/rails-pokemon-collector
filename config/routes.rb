Rails.application.routes.draw do
  resources :pokemon_cards
  resources :pokemon_sets
  resources :series
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root "series#index"
  # get "/series", to: "series#index", as: "series"
  # get "series/:id", to: "series#show", as: "series#show"
end
