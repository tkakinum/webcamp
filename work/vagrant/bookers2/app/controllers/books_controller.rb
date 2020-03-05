class BooksController < ApplicationController

  def top
    @books = Book.all
  end

  def about
    @books = Book.all
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.new
  end

  def create
    @book = Book.new(book_params)
    @books =Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error! can't be blank or letter is 2-20!"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
