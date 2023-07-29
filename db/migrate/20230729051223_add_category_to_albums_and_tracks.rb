class AddCategoryToAlbumsAndTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :category, :string
    add_column :tracks, :category, :string
  end
end
