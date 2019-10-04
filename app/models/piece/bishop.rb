class Piece::Bishop < ApplicationRecord
after_initialize :init

  def init
    self.type  = "bishop"           #will set the default value only if it's nil
  end
end
