class Public::HomesController < ApplicationController
  before_action :move_to_signed_in, except: [:top]
  def top
    @posts = Post.order(created_at: :desc)
  end 
end


private
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to new_user_session_path
    end
  end
