class BooksController < ApplicationController

  def show
    @book = Book.all
  end

  def index
    @books = Book.all
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	blog.save
  	redirect_to blogs_path
  end

  def edit
  end

  private
  def book_params
  	params.require(:blog).permit(:title, :body)
  end
end
