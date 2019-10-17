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


# move_to! - captured method
  def move_to!(new_x, new_y)

  #check to see if there is a piece in the location it's moving to.
    if is_occupied? == false
      update_attributes(location_x: new_x, location_y: new_y)
      redirect_back(fallback_location: root_path, alert: '#{current_user.id} moved to #{new_x, new_y}.')
      return
    else

#if there is a piece of opposite color occupying the location, remove piece from board.
      if self.piece.color != destination_piece_color
        update_attributes(location_x: null, location_y: null)
        destination_piece.update_attributes(status: "captured")
        redirect_back(fallback_location: root_path, alert: '#{current_user.id} captured the #{piece.type}!')
        return
      end

  # if there is a piece of the same color there, reset current player's piece position and display alert message
      if current_piece_color == destination_piece_color
        then piece.reset_turn
        redirect_back(fallback_location: root_path, alert: '#{current_user.id} has made an invalid move, try again.')
        return
      end
    end
  end

end
