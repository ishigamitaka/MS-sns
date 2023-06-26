class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end 
  def show
    @post = Post.find(params[:id])
  end 
  def delete
    @post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end 
end
