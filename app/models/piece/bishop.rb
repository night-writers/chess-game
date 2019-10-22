class Piece::Bishop < Piece
  def self.valid_move?(location_x, location_y, destination_x, destination_y, game)
    # position movement is allowed condition (moving only in diagonal directions)
    if (destination_x - location_x) == (destination_y - location_y)
      # if the piece moved in only diagonal directions, check if the piece is obstructed
      if is_obstructed?(location_x, location_y, destination_x, destination_y, game)
        return false
      else
        return true
      end
    else # piece is moving in a non-diagonal way
      return false
    end
  end
end
