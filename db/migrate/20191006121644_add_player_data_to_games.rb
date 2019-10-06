class AddPlayerDataToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :black_player_id, :integer
    add_column :games, :white_player_id, :integer
    add_column :games, :status, :string
    add_column :games, :winner_id, :integer
  end
end
