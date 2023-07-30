class Statistic < ApplicationRecord
  has_many :albums, foreign_key: "album_id"

  scope :add_to_statistics, ->(album_id) do
    record = find_by(album_id: album_id)

    if record
      record.increment!(:quantity, 1)
    else
      create(album_id: album_id, quantity: 1)
    end
  end
end
