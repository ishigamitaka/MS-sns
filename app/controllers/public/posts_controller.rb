class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    #@category = params[:category]
  end
  def index
    @posts = Post.all
    @post_comment = PostComment.new
  end
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end 
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: '投稿が作成されました。'
    else
      render :new
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end 
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :image, :run_category, :run_date, :price, :number_people)
  end
end
