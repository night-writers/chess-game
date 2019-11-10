class AddNewCoordinatesToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :new_x, :integer
    add_column :pieces, :new_y, :integer
  end
end
