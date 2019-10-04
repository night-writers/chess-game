class CreatePieceRooks < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_rooks do |t|

      t.timestamps
    end
  end
end
