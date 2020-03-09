Rails.application.routes.draw do
devise_for :users
  root 'books#top'
  get 'home/about' => 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  resources :post_images, only: [:new, :create, :index, :show]
end