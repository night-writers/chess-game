require 'rails_helper'

RSpec.describe Game, type: :model do
  it "should return true if the game is in check" do
    game = FactoryBot.create(:game)
    game.pieces.where(location_x: 5, location_y: 2).update(location_x: 4, location_y: 3)
    game.pieces.where(location_x: 1, location_y: 8).update(location_x: 5, location_y: 3)
    game.reload
    expect(game.pieces.where(location_x: 4, location_y: 3)).to eq "pawn5"
    expect(game.pieces.where(location_x: 5, location_y: 3)).to eq "rook1"
    expect(game.check?).to eq true
  end
end
