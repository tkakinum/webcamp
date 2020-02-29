Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorite, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  root 'post_images#index'
end
	resources :users, only: [:show, :edit, :update]
end