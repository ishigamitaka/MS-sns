class Public::FollowsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end
  
  private

  def follow_params
    params.require(:follow).permit(:user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
