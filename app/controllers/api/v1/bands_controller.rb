class Api::V1::BandsController < ApplicationController
  before_action :find_band, only: %i[ show edit update destroy ]

  # GET /bands or /bands.json
  def index
    @bands = Band.all
    render json: @bands
  end

  # GET /bands/1 or /bands/1.json
  def show
    @band_with_musicians = InfoService.show_band_with_musicians(@band)
    render json: @band_with_musicians
  end

  # POST /bands or /bands.json
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1 or /bands/1.json
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1 or /bands/1.json
  def destroy
    @band.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:band_name)
    end
    def find_band
      @band = Band.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Band not found' }, status: :not_found
    end

end
