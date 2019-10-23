class Piece::Knight < Piece
  def self.valid_move?(location_x, location_y, destination_x, destination_y)
    # If lateral movement is one space, allow two-space movement along y-axis
    # If lateral movement is two spaces, allow single-space movement along y-axis
    if ((destination_x - location_x) == 1) || ((location_x - destination_x) == 1)
      if ((destination_y - location_y) == 2) || ((location_y - destination_y) == 2)
        return true
      else
        return false
      end
    elsif ((destination_x - location_x) == 2) || ((location_x - destination_x) == 2)
      if ((destination_y - location_y) == 1) || ((location_y - destination_y) == 1)
        return true
      else
        return false
      end
    else #no valid movement conditions for knight met
      return false
    end
  end
end
