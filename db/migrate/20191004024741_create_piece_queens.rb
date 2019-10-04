class CreatePieceQueens < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_queens do |t|

      t.timestamps
    end
  end
end
