class DeleteCategoryColumnInTracks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tracks, :category_id
  end
end
