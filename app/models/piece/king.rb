class Piece::King < Piece
  def self.valid_move?(location_x, location_y, destination_x, destination_y)
    if (location_x - destination_x) <= 1 && (location_y - destination_y) <= 1 && (destination_x - location_x) <= 1 && (destination_y - location_y) <= 1
      return true
    else
      return false
    end
  end
end