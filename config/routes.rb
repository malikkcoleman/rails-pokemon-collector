Rails.application.routes.draw do
  resources :pokemon_cards
  resources :pokemon_sets
  resources :series
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "series#index"
  # get "/series", to: "series#index", as: "series"
  # get "series/:id", to: "series#show", as: "series#show"
  get "/pokemon_sets", to: "pokemon_sets#index"
  get "/pokemon_cards", to: "pokemon_cards#index"
  get "/about_page", to: "about_page#index"
  get "/search", to: "pokemon_cards#search"


end
