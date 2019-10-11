require 'rails_helper'

RSpec.describe Piece, type: :model do
# Temporary tests until functionality for adding pieces to a game is added.
  it "should return true if there is a horizontal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(4, 2, 1, 2)).to eq true
    end
    it "should return true if there is a vertical obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 4, 2, 1)).to eq true
    end
    it "should return true if there is a diagonal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(4, 4, 1, 1)).to eq true
    end
    it "should return false if there is no horizontal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 1, 2)).to eq false
    end
    it "should return false if there is no vertical obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 2, 1)).to eq false
    end
    it "should return false if there is no diagonal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 1, 1)).to eq false
    end
    it "should return invalid if the input is invalid" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(4, 4, 1, 5)).to eq "invalid input.  Not diagnal, horizontal, or vertical."
    end
end
