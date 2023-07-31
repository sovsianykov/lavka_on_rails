class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands, id: :string do |t|
      t.string :band_name
      t.timestamps
    end
  end
end

