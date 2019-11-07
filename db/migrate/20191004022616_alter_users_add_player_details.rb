class AlterUsersAddPlayerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wins, :integer, default: 0
    add_column :users, :losses, :integer, default: 0
    add_column :users, :active_games, :integer, array: true
  end
end
