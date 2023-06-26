class Public::PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.post_comments.build(post_comment_params)
    comment.user = current_user
    comment.save
    redirect_to root_path(post)
  end
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to root_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
