class Track < ApplicationRecord
  belongs_to :album

  def self.average_price
    average(:price)
  end
end
