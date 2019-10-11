class Game < ApplicationRecord
  has_many :pieces
  has_many :comments
  after_initialize :init
  # belongs_to :users
  scope :available, -> { where(status: "available") }
  
  def init
    self.status ||= "available"
  end
end

