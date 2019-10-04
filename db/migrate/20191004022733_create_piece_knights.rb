class CreatePieceKnights < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_knights do |t|

      t.timestamps
    end
  end
end
