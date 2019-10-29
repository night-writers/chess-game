class PiecesController < ApplicationController

  def show
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
  end

  def update
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
# call valid_move?
    @piece.valid_move?(params[:location_x], params[:location_y], params[:destination_x], params[:destination_y])

# call the move_to logic
    if @piece.valid_move? == true
      @piece.move_to!(params[:location_x], params[:location_y])
      @piece.update_attributes(piece_params)
      redirect_to game_path(@piece.game)
    end
    render plain: 'updated!'
  end

  private

  def pieces_params
    params.permit(:location_x, :location_y)
  end
end
