class AddDownloadTimesToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :download_times, :integer, default: 0
  end
end
