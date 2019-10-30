class Games::PiecesController < ApplicationController
  def show
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update_attributes(piece_params)
  end

  private
  
  def piece_params
    params.require(:piece).permit(:location_x, :location_y)
  end
end
