class BooksController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

  def top
    @books = Book.all
  end

  def about
    @books = Book.all
  end

  def new
    @book =Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error! can't be blank or letter is 2-20!"
      @books =Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.new
    @books = Book.all
    @mybook = Book.find(params[:id])
    @user = @mybook.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path
    else
        flash[:notice] = "error! can't be blank or letter is 2-20!"
        @books =Book.all
        @user = current_user
        render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
