class Game < ApplicationRecord
  has_many :pieces
  has_many :comments
  after_initialize :init
  belongs_to :user, optional: true
  scope :available, -> { where(status: "available") }
  
  def init
    self.status ||= "available"
    self.white_player_id ||= self.user_id
  end
end

