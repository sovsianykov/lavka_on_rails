class InfoService
  def self.show_band_with_musicians(band)
    artists_ids = BandArtist.where(band_id: band[:id]).pluck(:artist_id).uniq
    @artists_names = Artist.where(id: artists_ids).pluck(:artist_name).uniq
    @band_with_musicians = { band: band[:band_name], artists: @artists_names } # Fixed typo here
  end

  def show_bands_names
    Band.pluck(:band_name)
  end
end

