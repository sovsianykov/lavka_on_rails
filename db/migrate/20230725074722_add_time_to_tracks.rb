class AddTimeToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :time, :float, default: 1.00
  end
end
