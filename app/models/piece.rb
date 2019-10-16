class Piece < ApplicationRecord
  belongs_to :game
  
  def self.is_obstructed_horizontal?(xd, xl, yl)
      x_value = xl
        while (x_value > xd) && (x_value - 1) != xd 
          x_value = x_value - 1
          if self.is_occupied(x_value, yl)
            return true
          end
        end
       while (x_value < xd) && (x_value + 1) != xd
         x_value = x_value + 1
         if self.is_occupied(x_value, yl) 
           return true
         end
       end
         return false
   end
  
  def self.is_obstructed_vertical?(yd, yl, xl)
      y_value = yl
        while (y_value > yd) && (y_value - 1) != yd
          y_value = y_value - 1
          if self.is_occupied(xl, y_value) 
            return true
          end
        end
      while (y_value < yd) && (y_value + 1) != yd
        y_value = y_value + 1
        if self.is_occupied(xl, y_value) 
          return true
        end
      end
      return false
  end
  
  def self.is_obstructed_diagonal?(xd, yd, xl, yl)
      y_value = yl
        while (y_value > yd) && (y_value - 1) != yd
          y_value = y_value - 1
          x_value = xl
          if xl > xd
            x_value = x_value - 1
          elsif xl < xd
            x_value = x_value + 1
          end
          if self.is_occupied(x_value, y_value) 
            return true
          end
        end
      y_value = yl
        while (y_value < yd) && (y_value + 1) != yd
          y_value = y_value + 1
          x_value = xl
          if xl > xd
            x_value = x_value - 1
          elsif xl < xd
            x_value = x_value + 1
          end
          if self.is_occupied(x_value, y_value) 
            return true
          end
        end
      return false
  end
  
  def self.is_obstructed?(location_x, location_y, destination_x, destination_y)
    if location_y == destination_y
      self.is_obstructed_horizontal?(destination_x, location_x, location_y)
    elsif location_x == destination_x
      self.is_obstructed_vertical?(destination_y, location_y, location_x)
    elsif  (destination_x - location_x) != (destination_y - location_y)
      return "invalid input.  Not diagnal, horizontal, or vertical."
    else location_x != destination_x && location_y != destination_y
      self.is_obstructed_diagonal?(destination_x, destination_y, location_x, location_y)
    end
    
  end
  
  # Temporary method until functionality for adding pieces to a game is added.
  def self.is_occupied?(x, y)
      return true
      game.pieces.where(location_x: x, location_y: y).present?
  end

  def self.valid_move?(location_x, location_y, destination_x, destination_y)
    if (location_x - destination_x) <= 1 && (location_y - destination_y) <= 1 && (destination_x - location_x) <= 1 && (destination_y - location_y) <= 1
      return true
    else
      return false
    end
  end


# move_to! - captured pseudocode method
  #def move_to!(new_x, new_y)

  #check to see if there is a piece in the location it's moving to.
  #  if self.is_occupied? == false
  #  piece.current_player = piece.update_attributes(new_x, new_y)

  #  else 

  #  end

  #if there is a piece of opposite color occupying the location, remove piece from board.
  #  if current_piece_color != destination_piece_color
  #    then self.destination_piece = piece.update_attributes(null, null)
  #    alert "#{game.current_player} captured #{destination_piece_color}"
  #  end

  # if there is a piece of the same color there, reset current player's piece position and display alert message
  #  if self.is_occupied?(new_x, new_y) current_piece_color == destination_piece_color
  #    then piece.reset_turn
  #    alert "{game.current_player} has made an invalid move, try again."
  #  end

  # call update_attributes on the current player's piece and change the piece's x/y coords.
    #  piece.current_player = piece.update_attributes(new_x, new_y)
  # end


end
