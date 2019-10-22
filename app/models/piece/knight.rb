class Piece::Knight < Piece
  def self.valid_move?(origin_x, origin_y, destination_x, destination_y)
    # If lateral movement is one space, allow two-space movement along y-axis
    # If lateral movement is two spaces, allow single-space movement along y-axis
    # No checks for obstruction, as knight can "jump" over pieces
    if ((destination_x - origin_x) == 1) || ((origin_x - destination_x) == 1)
      if ((destination_y - origin_y) == 2) || ((origin_y - destination_y) == 2)
        return true
      else
        return false
      end
    elsif ((destination_x - origin_x) == 2) || ((origin_x - destination_x) == 2)
      if ((destination_y - origin_y) == 1) || ((origin_y - destination_y) == 1)
        return true
      else
        return false
      end
    else #no valid movement conditions for knight met
      return false
    end
  end
end
