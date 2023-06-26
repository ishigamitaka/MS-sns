class Public::TrackEventsController < ApplicationController
  def new
    @event = TrackEvent.new
  end 
  def index
    #binding.pry
    @events = TrackEvent.all
    @post_comment = PostComment.new
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
    params.require(:track_event).permit(:title, :body, :run_category, :run_date, :price, :number_people)
  end
  
  
end
