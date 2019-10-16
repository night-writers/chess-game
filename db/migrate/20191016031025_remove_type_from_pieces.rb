class RemoveTypeFromPieces < ActiveRecord::Migration[5.2]
  def change
    remove_column :pieces, :type
  end
end
