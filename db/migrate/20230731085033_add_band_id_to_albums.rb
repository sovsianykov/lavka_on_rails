class AddBandIdToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_reference :albums, :band, foreign_key: true
  end
end
