class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.float :price
      t.integer :album_id

      t.timestamps
    end
  end
end
