class Games::PiecesController < ApplicationController
  def show
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
  end

  def update
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
    # call the move_to logic
    if @piece.valid_move?(params[:location_x], params[:location_y], params[:destination_x], params[:destination_y], @piece.game) == true
      if @piece.game.check?
        flash[:notice] = "Check!"
      end
      @piece.move_to!(params[:location_x], params[:location_y])
      @piece.update_attributes(piece_params)
      redirect_to game_path(@piece.game)
    end
    render plain: 'updated!'
  end

  private
  
  def piece_params
    params.require(:piece).permit(:location_x, :location_y)
  end
end
