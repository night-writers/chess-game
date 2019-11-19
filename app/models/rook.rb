class Rook < Piece
# The rook can move horizontally or vertically (but not diagonally) any number of spaces as long as it isn't obstructed.
  def valid_move?(location_x, location_y, destination_x, destination_y, game, color)
    if is_obstructed?(location_x, location_y, destination_x, destination_y, game)
      return false
    elsif 
      location_x != destination_x && location_y != destination_y
      return false
    else
      return true
    end
  end
end