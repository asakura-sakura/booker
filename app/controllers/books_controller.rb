class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit 
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    
    redirect_to books_path
  end
  def create
    book= Book.new(book_params)
    
    book.save
    redirect_to books_path
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path  
  end  
  private
  def book_params

    params.require(:book).permit(:title,:body,:book_image).merge(user_id: current_user.id)
  end
end
