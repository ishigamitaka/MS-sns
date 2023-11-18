class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    #@category = params[:category]
  end
  def index
    @posts = Post.order(created_at: :desc)
    @post_comment = PostComment.new
  end
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end 
  def search
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
           Post.where('body LIKE ?', "%#{params[:search]}%")
               .order(created_at: :desc)
               .paginate(page: params[:page], per_page: 12)
         else
           Post.none
         end
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
    params.require(:post).permit(:body, :category_id, :image, :run_category, :run_date, :price, :number_people)
  end
end
