class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(user_params)
      redirect_to user_path(@user.id),notice:'You have updated user successfully.'
    else
      render :edit
    end
  end

  def destroy


  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
end

end

