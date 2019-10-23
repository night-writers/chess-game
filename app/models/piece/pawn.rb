class Piece::Pawn < Piece
  def self.valid_move?(location_x, location_y, destination_x, destination_y, game)
    if is_obstructed?(location_x, location_y, destination_x, destination_y, game)
      return false
    elsif (location_x == destination_x) && (location_y == destination_y)
      return false
    elsif (location_x != destination_x) && (location_y == destination_y)
      return false
    elsif (location_x != destination_x) && (location_y != destination_y) && (Piece.is_occupied(destination_x, destination_y, game) == true)
      return true
    elsif (location_x != destination_x) && (location_y != destination_y)
      return false
    elsif (location_x == destination_x) && (Piece.is_occupied(destination_x, destination_y, game) == true)
      return false
    elsif (game.user_id == game.white_player_id) && (destination_y < location_y)
      return false
    elsif (game.user_id == game.black_player_id) && (destination_y > location_y)
      return false   
    elsif (game.user_id == game.white_player_id) && (location_y == 2) && (location_x - destination_x) <= 2 && (location_y - destination_y) <= 2 && (destination_x - location_x) <= 2 && (destination_y - location_y) <= 2
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
