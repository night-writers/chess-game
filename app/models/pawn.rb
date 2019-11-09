class Pawn < Piece
  def valid_move?(location_x, location_y, destination_x, destination_y, game)
  # Check to see if the piece is obstructed.
    if is_obstructed?(location_x, location_y, destination_x, destination_y, game)
      return false
    end
  # Check to make sure a piece is not moving backwards.
    if (game.user_id == game.white_player_id)
      if (destination_y < location_y)
        return false
      end
    elsif (game.user_id == game.black_player_id)
      if (destination_y > location_y)
        return false
      end
    end
  # Check to make sure the destination isn't the same as the location, the piece isn't moving horizontally, and the space the piece is moving to isn't occupied. 
    if (location_x == destination_x && location_y == destination_y) || (location_x != destination_x && location_y == destination_y) || (location_x == destination_x && is_occupied?(destination_x, destination_y, game) == true)
      return false
    end
  # Check to see if it is possible to perform an en passant capture.
    if en_passant(location_x, location_y, destination_x, destination_y, game) == true
      if (location_x - destination_x) <= 1 && (location_y - destination_y) <= 1 && (destination_x - location_x) <= 1 && (destination_y - location_y) <= 1
        return true
      else
        return false
      end
    end
  # Allow the pawn to move diagonally only to capture a piece
    if (location_x != destination_x) && (location_y != destination_y) && (game.pieces.where(destination_x, destination_y).present? == false)
      return false
    end
  # Allow the pawn to move two spaces if it's in the starting position, otherwise only allow the pawn to move one space.
    if (game.user_id == game.white_player_id) && (location_y == 2) && (location_x - destination_x) <= 2 && (location_y - destination_y) <= 2 && (destination_x - location_x) <= 2 && (destination_y - location_y) <= 2
      return true
    elsif (game.user_id == game.black_player_id) && (location_y == 7) && (location_x - destination_x) <= 2 && (location_y - destination_y) <= 2 && (destination_x - location_x) <= 2 && (destination_y - location_y) <= 2
      return true
    elsif (location_x - destination_x) <= 1 && (location_y - destination_y) <= 1 && (destination_x - location_x) <= 1 && (destination_y - location_y) <= 1 
      return true
    else
      return false  
    end
  end
end
