class Api::V1::TracksController < ApplicationController
  before_action :find_track, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  def index
    if params[:popular].present?
      @tracks = Track.most_popular(limit_param)
    else
      @tracks = Track.all
    end
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

  def popular
    @popular_tracks = Track.most_popular
    render json: @popular_tracks
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
