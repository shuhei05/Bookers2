class BooksController < ApplicationController

def index
  @books = Book.all
  @book = Book.new
  @user = User.all
end

def
  show
end

def new

end

def
  create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to book_path(book.id)
end

def
  edit
end

def
  updated
end

def
  destroy
end

private
def book_params
   params.require(:book).permit(:title, :body)
end

end