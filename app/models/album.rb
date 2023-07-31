class Album < ApplicationRecord
  has_many :tracks
  has_one :statistics
  belongs_to :band
  
  scope :with_tracks, -> { includes(:tracks)  }
end
