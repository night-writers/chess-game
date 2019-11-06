class AddTypeToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :type, :string
  end
end
