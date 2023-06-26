class Admin::CircuitTracksController < ApplicationController
  def new
    @circuit_track = CircuitTrack.new
  end 
  def index
    @circuit_tracks = CircuitTrack.all
  end 
  def show
    @circuit_track = CircuitTrack.find(params[:id])
  end 
  def edit 
    @circuit_track = CircuitTrack.find(params[:id])
  end 
  def create
    @circuit_track = CircuitTrack.new(circuit_track_params)
    if @circuit_track.save
      redirect_to circuit_tracks_path, notice: '投稿が作成されました。'
    else
      render :new
    end
  end
  def destroy
    @circuit_track = CircuitTrack.find(params[:id])
    @circuit_track.destroy
    redirect_to circuit_tracks_path
  end
  
  private
  
  def circuit_track_params
    params.require(:circuit_track).permit(:name, :address, :circuit_image)
  end 
end
