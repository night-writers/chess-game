class Piece::Rook < ApplicationRecord
after_initialize :init

  def init
    self.type  = "rook"           #will set the default value only if it's nil
  end
end
