class CreatePieceKings < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_kings do |t|

      t.timestamps
    end
  end
end
