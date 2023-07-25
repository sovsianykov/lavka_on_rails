class AddRateToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :rate, :float, default: 0
  end
end
