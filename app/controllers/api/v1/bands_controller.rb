class Api::V1::BandsController < ApplicationController
  before_action :find_band, only: %i[ show edit update destroy ]

  def index
    @bands = Band.all
    render json: @bands
  end

  def show
    @band_with_musicians = InfoService.show_band_with_musicians(@band)
    render json: @band_with_musicians
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @band.destroy
    head :no_content
  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:band_name)
    end
    def find_band
      @band = Band.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Band not found' }, status: :not_found
    end

end
