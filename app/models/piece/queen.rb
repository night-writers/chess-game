class Piece::Queen < ApplicationRecord
  after_initialize :init

  def init
    self.type  = "queen"           #will set the default value only if it's nil
  end
end
