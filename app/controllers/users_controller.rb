class UsersController < ApplicationController
  def show
    @user = current_user
    @books = @user.books.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to books_path
  end

  def index
    @user = current_user
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

