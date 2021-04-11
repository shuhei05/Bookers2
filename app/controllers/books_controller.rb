class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :book_user,   only: [:edit, :update]

def index
  @books = Book.all
  @book = Book.new
  @user = current_user
end

def show
  @book_list = Book.find(params[:id])
  @user = @book_list.user
  @book = Book.new
end

def new

end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if
     @book.save
     redirect_to book_path(@book.id),notice:'You have created book successfully.'
  else
     @books = Book.all
     @user = current_user
     render :index
  end
end

def edit
  @book = Book.find(params[:id])
end

def update
    @book = Book.find(params[:id])
    if
        @book.update(book_params)
        redirect_to book_path(@book.id),notice:'You have updated book successfully.'
    else
        render :edit
    end
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

private

  def book_user
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user_id == current_user.id
  end

  def book_params
   params.require(:book).permit(:title, :body,)

  end

end