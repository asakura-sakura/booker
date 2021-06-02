class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end
  def show
    @newBook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit 
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id.to_s
    else
      redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
    @valid = Book.find(params[:id])
    if @valid.update(book_params)
      redirect_to book_path(params[:id]), notice: "You have updated user successfully."
    else 
      render :edit
    end
  end
  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id), notice: "You have updated user successfully."
    else
      @user = User.find(current_user.id)
      @books = Book.all
      @valid = book
      render :index
    end
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
