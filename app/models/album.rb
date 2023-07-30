class Album < ApplicationRecord
  has_many :tracks
  has_one :statistics

  
  scope :with_tracks, -> { includes(:tracks)  }
end
