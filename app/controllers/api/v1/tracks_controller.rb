class Api::V1::TracksController < ApplicationController
  before_action :find_track, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  def index
    @tracks = ShowTracks.show_all_tracks(limit_param,params)
    render json: @tracks, status: 200
  end

  def show
    render json: @track
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def update
    if @track.update(track_params)
      render json: @track
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @track.destroy
    head :no_content
  end
  
  def info
    @average_price = Track.average_price
    @info = { message: @average_price}
    render json: @info, status: 200
  end

  def show_quantity
    @tracks = ShowTracks.track_titles_with_quantities
    render json: @tracks
  end

  private

  def track_params
    params.require(:track).permit(:title, :price, :album_id)
  end
  
  def limit_param
    params[:limit].to_i
  end

  def find_track
    @track = Track.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Track not found' }, status: :not_found
  end
end
