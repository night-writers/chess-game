module Piece
  # belongs_to :games
  def self.table_name_prefix
    'piece_'
  end
  
  def self.is_obstructed_horizontal?(xd, xl, yl)
    if (xl > xd) && (xl - 1) != xd
      b = xl
        while (b > xd) && (b - 1) != xd 
          b = b - 1
          if self.is_occupied(b, yl)
            return true
          end
        end
    end
    if (xl < xd) && (xl + 1) != xd
      c = xl
      while (c < xd) && (c + 1) != xd
        c = c + 1
        if self.is_occupied(c, yl) 
          return true
        end
      end
    end
      return false
  end
  
  def self.is_obstructed_vertical?(yd, yl, xl)
    if (yl > yd) && (yl - 1) != yd
      f = yl
        while (f > yd) && (f - 1) != yd
          f = f - 1
          if self.is_occupied(xl, f) 
            return true
          end
        end
    end
    if (yl < yd) && (yl + 1) != yd
      h = yl
      while (h < yd) && (h + 1) != yd
        h = h + 1
        if self.is_occupied(xl, h) 
          return true
        end
      end
    end
      return false
  end
  
  def self.is_obstructed_diagonal?(xd, yd, xl, yl)
    if (yl > yd) && (yl - 1) != yd
      j = yl
        while (j > yd) && (j - 1) != yd
          j = j - 1
          k = xl
          if xl > xd
            k = k - 1
          elsif xl < xd
            k = k + 1
          end
          if self.is_occupied(k, j) 
            return true
          end
        end
    end
    if (yl < yd) && (yl + 1) != yd
      j = yl
        while (j < yd) && (j + 1) != yd
          j = j + 1
          k = xl
          if xl > xd
            k = k - 1
          elsif xl < xd
            k = k + 1
          end
          if self.is_occupied(k, j) 
            return true
          end
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
  def self.is_occupied(x, y)
    a = 2
    b = 2
    if a == 2 && b == 2
      return true
    else
      return false
    end
    #game.pieces.where(location_x: x, location_y: y).present?
  end

end
