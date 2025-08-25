class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.all
  end

  def edit
  end

  def new
  end
end
