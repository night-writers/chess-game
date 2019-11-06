class AddTurnsToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :turn, :integer
  end
end
