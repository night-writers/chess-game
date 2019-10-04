class CreatePieceBishops < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_bishops do |t|

      t.timestamps
    end
  end
end
