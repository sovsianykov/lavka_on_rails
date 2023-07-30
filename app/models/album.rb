class Album < ApplicationRecord
  has_many :tracks

    
  scope :with_tracks, -> { includes(:tracks)  }
end
