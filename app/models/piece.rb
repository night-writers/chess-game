module Piece
  belongs_to :games
  def self.table_name_prefix
    'piece_'
  end
end
