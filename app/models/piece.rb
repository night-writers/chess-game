module Piece
 belongs_to :user
 belongs_to :game
  def self.table_name_prefix
    'piece_'
  end
end
