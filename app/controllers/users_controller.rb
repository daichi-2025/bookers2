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

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

