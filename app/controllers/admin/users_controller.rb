class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end 
  def show 
    @user = User.find(params[:id])
  end 
  def edit
    @user = User.find(params[:id])
  end 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User successfully updated."
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :address, :age, :mycar, :main_circuit, :freeprofile) # Add other permitted attributes
  end
end
