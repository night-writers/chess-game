class AlterGamesAddModelDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :player_id_black, :integer
    add_column :games, :player_id_white, :integer
    add_column :games, :status, :string
    add_column :games, :winner_id, :integer
  end
end
