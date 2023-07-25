class Album < ApplicationRecord
  has_many :tracks

  def self.with_tracks
    includes(:tracks)
  end
end
