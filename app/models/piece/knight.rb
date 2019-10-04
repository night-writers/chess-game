class Piece::Knight < ApplicationRecord
after_initialize :init

  def init
    self.type  = "knight"           #will set the default value only if it's nil
  end
end
