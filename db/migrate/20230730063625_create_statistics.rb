class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :album, foreign_key: true
      t.integer :quantity, default: 100

      t.timestamps
    end
  end
end
