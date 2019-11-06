class AddTurnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :turn, :integer
  end
end
