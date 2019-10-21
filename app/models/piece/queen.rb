class Piece::Queen < Piece
# Since the queen can move in any direction, the valid move can be checked just by calling is_obstructed.
  def self.valid_move?(location_x, location_y, destination_x, destination_y, game)
    if is_obstructed?(location_x, location_y, destination_x, destination_y, game)
      return false
    else
      return true
    end
  end
end
