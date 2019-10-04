class CreatePiecePawns < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_pawns do |t|

      t.timestamps
    end
  end
end
