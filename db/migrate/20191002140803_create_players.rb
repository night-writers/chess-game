class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :email
      t.integer :wins
      t.integer :losses
      t.integer :active_games, array: true
      t.timestamps
    end
  end
end
