class AlterUsersAddPlayerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wins, :integer
    add_column :users, :losses, :integer
    add_column :users, :active_games, :integer, array: true
  end
end
