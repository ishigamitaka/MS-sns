class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end 
  def show 
    @user = User.find(params[:id])
    @my_best_times = @user.my_best_times
  end 
  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path, alert: "アクセス権限がありません。"
    else
    end 
    if @user.my_best_times.count == 0 
      @user.my_best_times.build()
    end 
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User successfully updated."
    else
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to users_path, notice: "ユーザーが削除されました。"
  end
  
  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user, notice: 'フォローしました'
  end
  
  def followers
    @user = User.find(params[:user_id])
    @users = user.followers
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to @user, notice: 'フォローを解除しました'
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :address, :age, :mycar, :mycar_image, :circuit_track_id, :freeprofile, :email, :password, my_best_times_attributes: [:my_best_time, :circuit_track_id, :_destroy, :id] )
  end

  def set_user
    @user = User.find(params[:id])
  end
  # private
  
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :nick_name, :address, :age, :mycar, :main_circuit, :freeprofile) # Add other permitted attributes
  # end
end
