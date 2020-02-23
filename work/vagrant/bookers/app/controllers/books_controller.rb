class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
  end

  def create
    book = Book.edit(book_params)
    book.save
    redirect_to '/show'

  end

  def edit
    @book = Book.edit
  end

  def show
  end

  def update
    @book =Book.edit
  end

  def destroy
  end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
