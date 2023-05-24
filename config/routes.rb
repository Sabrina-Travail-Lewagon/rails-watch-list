Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'lists', to: 'lists#index'
  root 'lists#index'
  get 'lists/new', to: 'lists#new'
  post 'lists', to: 'lists#create'
  get 'lists/:id', to: 'lists#show', as: :list
  get "lists/:list_id/new", to: 'bookmarks#new', as: :new_list_bookmark
  post "lists/:list_id/bookmarks", to: 'bookmarks#create', as: :list_bookmarks
  # get "lists/:list_id/bookmarks/new", to: 'bookmarks#new', as: :new_list_bookmark
  # post "lists/:list_id/bookmarks", to: 'bookmarks#create', as: :list_bookmarks
  get "lists/:list_id/bookmarks", to: 'bookmarks#index'
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
