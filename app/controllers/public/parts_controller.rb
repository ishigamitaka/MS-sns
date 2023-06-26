class Public::PartsController < ApplicationController
  def new
    @part = Part.new
  end 
  def index
    @parts = Part.all
    @post_comment = PostComment.new
  end 
  def show
    @part = Part.find(params[:id])
  end 
  def create
    @part = Part.new(part_params)
    @part.user_id = current_user.id
    if @part.save
      redirect_to parts_path, notice: '投稿が作成されました。'
    else
      render :new
    end
  end
  
  
  private

  def part_params
    params.require(:part).permit(:parts_name, :parts_image, :howmuch, :effect, :review)
  end
end
