Rails.application.routes.draw do
  get 'books/index'
  get 'books/create'
  get 'books/edit'
  get 'books/show'
  get 'books/update'
  get 'books/destroy'
  get 'books/index'
  get 'books/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'books#top'

  post 'books' => 'books#create'

  get 'books/:id' => 'books#show', as: 'book'

end
