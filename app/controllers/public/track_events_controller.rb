class Public::TrackEventsController < ApplicationController
  def new
    @event = TrackEvent.new
  end 
  def index
    #binding.pry
    @events = TrackEvent.order(created_at: :desc)
    @post_comment = PostComment.new
  end 
  def show
    @event = TrackEvent.find(params[:id])
    @post_comment = PostComment.new
    @post = Post.find(params[:id])
    #@event.reload
    #byebug
  end 
  def edit
    @event = TrackEvent.find(params[:id])
    if current_user.id != @event.user_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end 
  end
  def update
    @event = TrackEvent.find(params[:id])
    if @event.update(track_event_params)
      redirect_to track_event_path(@event), notice: "イベントを更新しました。"
    else
      render :edit
    end
  end 
  def destroy
    @event = TrackEvent.find(params[:id])
    @event.destroy
    redirect_to track_events_path
  end 
  def update_deadline_event
    @event = TrackEvent.find(params[:id])
    if @event.update(track_event_params)
      #byebug
      #@event.reload
      redirect_to @event, notice: "締め切りが更新されました。"
    else
      render :show, notice: "処理に失敗しました"
    end
  end
  def create
    @event = TrackEvent.new(track_event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to track_events_path, notice: '投稿が作成されました。'
    else
      render :new
    end
  end
  
  def search
    @events = TrackEvent.all
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
           TrackEvent.where('te.run_category LIKE ? OR te.title LIKE OR te.body LIKE',
              "%#{params[:search]}%")
               .order(created_at: :desc)
               .paginate(page: params[:page], per_page: 12)
         else
           TrackEvent.none
         end
  end
  
  
  private

  def track_event_params
    params.require(:track_event).permit(:title, :body, :run_category, :run_date, :price, :number_people, :deadline, :update, :location, :due_date, :payment_method, :contact_address, :content, :post_id)
  end
  
  
end
