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
    it "should return true if the move for the knight is valid" do
      #game = FactoryBot.create(:game)
      expect(Piece::Knight.valid_move?(3, 3, 1, 2)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 1, 4)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 2, 1)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 2, 5)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 4, 1)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 4, 5)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 5, 2)).to eq true
      expect(Piece::Knight.valid_move?(3, 3, 5, 4)).to eq true
      expect(Piece::Knight.valid_move?(4, 1, 5, 3)).to eq true
    end
    it "should return false if the move for the knight is valid" do
      #game = FactoryBot.create(:game)
      expect(Piece::Knight.valid_move?(3, 3, 1, 1)).to eq false
      expect(Piece::Knight.valid_move?(4, 1, 2, 4)).to eq false
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
    it "should return true if the move for the bishop is valid" do
      game = FactoryBot.create(:game)
      expect(Piece::Bishop.valid_move?(3, 1, 4, 2, game)).to eq true
      expect(Piece::Bishop.valid_move?(3, 1, 5, 3, game)).to eq true
    end
    it "should return false if the move for the bishop is invalid" do
      game = FactoryBot.create(:game)
      expect(Piece::Bishop.valid_move?(3, 1, 5, 2, game)).to eq false
      expect(Piece::Bishop.valid_move?(3, 1, 3, 3, game)).to eq false
    end
    it "should return true if the move for the pawn is valid" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user_id: 1, white_player_id: 1)
      game2 = FactoryBot.create(:game, user_id: 2, black_player_id: 2)
      expect(Piece::Pawn.valid_move?(3, 2, 3, 4, game)).to eq true
      expect(Piece::Pawn.valid_move?(2, 4, 2, 5, game)).to eq true
      expect(Piece::Pawn.valid_move?(3, 7, 3, 5, game2)).to eq true
      expect(Piece::Pawn.valid_move?(3, 6, 3, 5, game2)).to eq true
      piece = FactoryBot.create(:piece, id: 1, location_x: 4, location_y: 4, game_id: game.id, player_id: game.user_id)
      expect(Piece::Pawn.valid_move?(3, 3, 4, 4, game)).to eq true
    end
    it "should return false if the move for the pawn is invalid" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user_id: 1, white_player_id: 1)
      game2 = FactoryBot.create(:game, user_id: 2, black_player_id: 2)
      expect(Piece::Pawn.valid_move?(3, 2, 3, 5, game)).to eq false
      expect(Piece::Pawn.valid_move?(2, 4, 2, 6, game)).to eq false
      expect(Piece::Pawn.valid_move?(2, 4, 4, 4, game)).to eq false
      expect(Piece::Pawn.valid_move?(3, 2, 3, 1, game)).to eq false
      expect(Piece::Pawn.valid_move?(3, 3, 4, 4, game)).to eq false
      expect(Piece::Pawn.valid_move?(3, 3, 3, 3, game)).to eq false
      expect(Piece::Pawn.valid_move?(3, 7, 3, 4, game2)).to eq false
      expect(Piece::Pawn.valid_move?(3, 6, 3, 4, game2)).to eq false
      expect(Piece::Pawn.valid_move?(3, 7, 3, 8, game2)).to eq false
      piece = FactoryBot.create(:piece, id: 1, location_x: 3, location_y: 4, game_id: game.id, player_id: game.user_id)
      expect(Piece::Pawn.valid_move?(3, 3, 3, 4, game)).to eq false
    end     
end
