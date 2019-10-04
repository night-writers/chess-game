class Piece::King < ApplicationRecord
  after_initialize :init

  def init
    self.type  = "king"           #will set the default value only if it's nil
  end
end
