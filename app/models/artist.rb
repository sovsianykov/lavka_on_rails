class Artist < ApplicationRecord
  has_many :band_artists
  has_many :bands, through: :band_artists
end
