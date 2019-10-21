class Piece < ApplicationRecord
  belongs_to :game
  
  def self.is_obstructed_horizontal?(xd, xl, yl, game)
      x_value = xl
        while (x_value > xd) && (x_value - 1) != xd 
          x_value = x_value - 1
          if self.is_occupied(x_value, yl, game)
            return true
          end
        end
       while (x_value < xd) && (x_value + 1) != xd
         x_value = x_value + 1
         if self.is_occupied(x_value, yl, game) 
           return true
         end
       end
         return false
   end
  
  def self.is_obstructed_vertical?(yd, yl, xl, game)
      y_value = yl
        while (y_value > yd) && (y_value - 1) != yd
          y_value = y_value - 1
          if self.is_occupied(xl, y_value, game) 
            return true
          end
        end
      while (y_value < yd) && (y_value + 1) != yd
        y_value = y_value + 1
        if self.is_occupied(xl, y_value, game) 
          return true
        end
      end
      return false
  end
  
  def self.is_obstructed_diagonal?(xd, yd, xl, yl, game)
      y_value = yl
      x_value = xl
        while (y_value > yd) && (y_value - 1) != yd
          y_value = y_value - 1
          if xl > xd
            x_value = x_value - 1
          elsif xl < xd
            x_value = x_value + 1
          end
          if self.is_occupied(x_value, y_value, game) 
            return true
          end
        end
        while (y_value < yd) && (y_value + 1) != yd
          y_value = y_value + 1
          if xl > xd
            x_value = x_value - 1
          elsif xl < xd
            x_value = x_value + 1
          end
          if self.is_occupied(x_value, y_value, game) 
            return true
          end
        end
      return false
  end
  
  def self.is_obstructed?(location_x, location_y, destination_x, destination_y, game)
    if location_y == destination_y
      self.is_obstructed_horizontal?(destination_x, location_x, location_y, game)
    elsif location_x == destination_x
      self.is_obstructed_vertical?(destination_y, location_y, location_x, game)
    elsif  (destination_x - location_x) != (destination_y - location_y)
      return "invalid input.  Not diagnal, horizontal, or vertical."
    else location_x != destination_x && location_y != destination_y
      self.is_obstructed_diagonal?(destination_x, destination_y, location_x, location_y, game)
    end
  end
  
  # Checks if there is a piece at the specified location.
  def self.is_occupied(x, y, game)
    game.pieces.where(location_x: x, location_y: y).present?
  end
  
 # Capture method, update piece method, move_to! method
 def capture_piece!
    update_attributes({location_x: nil, location_y: nil, status: "captured"})
  end

  def update_piece_location!(new_x, new_y)
    self.update_attributes({location_x: new_x, location_y: new_y})
  end


  def move_to!(new_x, new_y)

    if is_occupied(new_x, new_y, game)
      piece_at_destination = game.pieces.find_by(location_x: new_x, location_y: new_y)
      if piece_at_destination.user != self.user
        piece_at_destination.capture_piece!
        update_piece_location!(new_x, new_y)
      else
        raise 'Player has made an invalid move, try again.'
      end

    else
      update_piece_location!(new_x, new_y)
    end
  end
end
