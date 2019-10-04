class Piece::Pawn < ApplicationRecord
  after_initialize :init

  def init
    self.type  = "pawn"           #will set the default value only if it's nil
  end
end
