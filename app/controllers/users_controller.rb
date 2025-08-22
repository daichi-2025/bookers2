class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_books = @user.post_books
  end

  def edit
  end

  def new
  end
end
