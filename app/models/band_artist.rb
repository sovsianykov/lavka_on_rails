class BandArtist < ApplicationRecord
  belongs_to :band
  belongs_to :artist

  scope :artists_for_band, ->(band_id) do
    where(band_id: band_id).pluck(:artist_id).uniq
  end
end
