class CreateTrackQuantities < ActiveRecord::Migration[7.0]
  def change
    create_table :track_quantities do |t|
      t.references :track, foreign_key: true
      t.integer :quantity, default: 100
      t.timestamps
    end
  end
end
