class Game < ApplicationRecord
  has_many :pieces
  has_many :comments
  belongs_to :users
end
