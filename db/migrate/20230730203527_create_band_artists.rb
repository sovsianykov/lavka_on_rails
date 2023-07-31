
class CreateBandArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :band_artists do |t|
      t.references :band, foreign_key: true
      t.references :artist, foreign_key: true
      t.timestamps
    end

    add_index :band_artists, [:band_id, :artist_id], unique: true
  end
end

