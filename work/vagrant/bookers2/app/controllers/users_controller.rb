class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = "User was successfully created."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error! can't be blank or letter is 1-50!"
      render :index
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
