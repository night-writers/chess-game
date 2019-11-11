class Bishop < Piece
  def valid_move?(location_x, location_y, destination_x, destination_y, game)
    # position movement is allowed condition (moving only in diagonal directions)
    if (location_x != destination_x) && (location_y != destination_y)
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
