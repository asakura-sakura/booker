class UsersController < ApplicationController
  def index
    @userId = current_user.id
    @user = User.find(current_user.id)
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end
  private

  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)
  end
end
