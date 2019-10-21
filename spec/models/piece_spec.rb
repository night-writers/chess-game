require 'rails_helper'

RSpec.describe Piece, type: :model do
# Temporary tests until functionality for adding pieces to a game is added.
  it "should return true if there is a horizontal obstruction" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, id: 1, location_x: 2, location_y: 2, game_id: game.id, player_id: game.user_id)
      expect(Piece.is_obstructed?(4, 2, 1, 2, game)).to eq true
    end
    it "should return true if there is a vertical obstruction" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, id: 1, location_x: 2, location_y: 2, game_id: game.id, player_id: game.user_id)
      expect(Piece.is_obstructed?(2, 4, 2, 1, game)).to eq true
    end
    it "should return true if there is a diagonal obstruction" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, id: 1, location_x: 2, location_y: 2, game_id: game.id, player_id: game.user_id)
      expect(Piece.is_obstructed?(4, 4, 1, 1, game)).to eq true
    end
    it "should return false if there is no horizontal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 1, 2, game)).to eq false
      expect(Piece.is_obstructed?(4, 2, 1, 2, game)).to eq false
    end
    it "should return false if there is no vertical obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 2, 1, game)).to eq false
      expect(Piece.is_obstructed?(2, 4, 2, 1, game)).to eq false
    end
    it "should return false if there is no diagonal obstruction" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(2, 2, 1, 1, game)).to eq false
      expect(Piece.is_obstructed?(4, 4, 1, 1, game)).to eq false
    end
    it "should return invalid if the input is invalid" do
      game = FactoryBot.create(:game)
      expect(Piece.is_obstructed?(4, 4, 1, 5, game)).to eq "invalid input.  Not diagnal, horizontal, or vertical."
    end
end
