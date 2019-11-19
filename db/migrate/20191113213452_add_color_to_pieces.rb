class AddColorToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :color, :string
  end
end
