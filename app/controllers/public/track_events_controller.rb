class Public::TrackEventsController < ApplicationController
  def new
    @event = TrackEvent.new
  end 
  def index
    #binding.pry
    @events = TrackEvent.all
    @post_comment = PostComment.new
  end 
  def show
    @event = TrackEvent.find(params[:id])
  end 
  
  module Public
    class EventsController < ApplicationController
      # コントローラーのコード
      def update_deadline
        @event = Event.find(params[:id])
        # フォームから送信された締め切りの値を更新する処理
        if @event.update(event_params)
          redirect_to @event, notice: "締め切りが更新されました。"
        else
          # 更新に失敗した場合の処理
          render track_event_path(@event), notice: "処理に失敗しました"
        end
      end
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
  
  
  private

  def track_event_params
    params.require(:track_event).permit(:title, :body, :run_category, :run_date, :price, :number_people, :deadline)
  end
  
  
end
