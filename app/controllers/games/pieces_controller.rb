class Games::PiecesController < ApplicationController
  def show
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
  end

  def update
    @piece = Piece.find(params[:id])
    return render_not_found if @piece.blank?
    @piece.update_attributes(piece_params)
    # call the move_to logic
    if @piece.valid_move?(@piece.location_x, @piece.location_y, @piece.new_x, @piece.new_y, @piece.game)
      if @piece.game.check?(Game.find(@piece.game_id))
        flash[:notice] = "Check!"
      end
      @piece.move_to!(@piece.new_x, @piece.new_y)
    
      # redirect_to game_path(@piece.game)
    end
    # render plain: 'updated!'
  end

  private
  
  def piece_params
    params.require(:piece).permit(:new_x, :new_y)
  end
end
