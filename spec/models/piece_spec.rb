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
    it "should return true if the move for the king is valid" do
      game = FactoryBot.create(:game)
      expect(Piece::King.valid_move?(2, 2, 1, 2)).to eq true
      expect(Piece::King.valid_move?(2, 2, 2, 1)).to eq true
      expect(Piece::King.valid_move?(2, 2, 1, 1)).to eq true
    end
    it "should return false if the move for the king is invalid" do
      game = FactoryBot.create(:game)
      expect(Piece::King.valid_move?(2, 2, 1, 5)).to eq false
      expect(Piece::King.valid_move?(3, 3, 1, 3)).to eq false
      expect(Piece::King.valid_move?(3, 3, 3, 1)).to eq false
      expect(Piece::King.valid_move?(3, 3, 1, 1)).to eq false
    end
    it "should return true if the move for the queen is valid" do
      game = FactoryBot.create(:game)
      expect(Piece::Queen.valid_move?(4, 2, 1, 2, game)).to eq true
      expect(Piece::Queen.valid_move?(2, 4, 2, 1, game)).to eq true
      expect(Piece::Queen.valid_move?(4, 4, 1, 1, game)).to eq true
    end
    it "should return false if the move for the queen is invalid" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      expect(Piece::Queen.valid_move?(4, 4, 1, 5, game)).to eq false
      piece = FactoryBot.create(:piece, id: 1, location_x: 2, location_y: 2, game_id: game.id, player_id: game.user_id)
      expect(Piece::Queen.valid_move?(4, 2, 1, 2, game)).to eq false
      expect(Piece::Queen.valid_move?(2, 4, 2, 1, game)).to eq false
      expect(Piece::Queen.valid_move?(4, 4, 1, 1, game)).to eq false
    end
    it "should return true if the move for the rook is valid" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      expect(Piece::Rook.valid_move?(4, 2, 1, 2, game)).to eq true
      expect(Piece::Rook.valid_move?(2, 4, 2, 1, game)).to eq true
      expect(Piece::Rook.valid_move?(4, 1, 4, 2, game)).to eq true
    end
    it "should return false if the move for the rook is invalid" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      expect(Piece::Rook.valid_move?(1, 4, 2, 5, game)).to eq false
      expect(Piece::Rook.valid_move?(4, 3, 2, 1, game)).to eq false
      expect(Piece::Rook.valid_move?(3, 4, 5, 6, game)).to eq false
      expect(Piece::Rook.valid_move?(5, 3, 3, 5, game)).to eq false
    end    
end
