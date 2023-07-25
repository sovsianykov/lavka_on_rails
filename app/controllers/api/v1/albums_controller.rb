class Api::V1::AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @albums = Album.all
    render json: @albums
  end

  def show
    render json: @album
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    head :no_content
  end

  private

  def album_params
    params.require(:album).permit(:title, :price)
  end

  def find_album
    @album = Album.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Album not found' }, status: :not_found
  end
end
