class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def index

    @userId = current_user.id
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new

  end
  def show
    @user = User.find(params[:id])
    @book = Book.new();
    
    @books = Book.where(user_id: params[:id])
    
  end
  def edit
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
    else 
      redirect_to user_path(current_user.id)
    end

 
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)
  end
end
