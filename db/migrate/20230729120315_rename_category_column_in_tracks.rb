class RenameCategoryColumnInTracks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tracks, :category, :category_id
  end
end
