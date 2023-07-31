class Band < ApplicationRecord
  has_many :band_artists
  has_many :albums
  has_many :artists, through: :band_artists
 
end
