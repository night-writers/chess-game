require 'rails_helper'

RSpec.describe Piece::King, type: :model do
  it "should return true if the move is valid" do
    expect(Piece::King.valid_move?(1, 1, 2, 2)).to eq true
    expect(Piece::King.valid_move?(2, 2, 1, 1)).to eq true
  end
  it "should return false if the move is invalid" do
    expect(Piece::King.valid_move?(1, 1, 3, 3)).to eq false
    expect(Piece::King.valid_move?(3, 3, 1, 1)).to eq false  
  end
end
