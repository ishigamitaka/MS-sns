class Public::CircuitTracksController < ApplicationController
  def index
    @circuit_tracks = CircuitTrack.all
  end 
  def show
    #@circuit_track = CircuitTrack.find(params[:id])
   #@top_times = @circuit_track.my_best_time.order('time ASC').limit(10)
    @circuit_track = CircuitTrack.find(params[:id])
    @top_times = @circuit_track.my_best_times.order(my_best_time: :asc).limit(10)
  end 
  
  private
  
  def circuit_track_params
    params.require(:circuit_track).permit(:name, :address, :circuit_image)
  end 
end
