class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :type
      t.string :color
      t.integer :location_x
      t.integer :location_y
      t.integer :game_id
      t.string :status
      t.timestamps
    end
  end
end
