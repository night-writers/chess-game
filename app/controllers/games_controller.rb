class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    if @game.blank?
      render_not_found
    end
    @pieces = @game.pieces
  end

  def new
    if current_user 
      @game = Game.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @game = current_user.games.create(game_params)
    @game.populate_game
    redirect_to root_path
  end

  def update
    @game = Game.find(params[:id])
    if @game.white_player_id != current_user.id && @game.black_player_id != current_user.id 
      @game.update_attribute(:black_player_id, current_user.id) 
      redirect_back(fallback_location: root_path, alert: 'You have joined the game as the Black player.')
    else
      redirect_back(fallback_location: root_path, alert: 'You have already joined this game.')
    end
  end

  private

  helper_method :piece_at
  def piece_at(x, y)
    piece_id = 0
   @pieces.each do |piece|
      if piece.location_x == x && piece.location_y == y
        piece_id = piece.id
      end
    end
    if(piece_id != 0)
      return piece_id
    end
  end

  helper_method :piece_move
  def piece_move
    @piece.move_to!(params[:x_location], params[:y_location])
    redirect_to game_path(@piece.game)
  end
  
  helper_method :current_game
  def current_game
    @current_game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name)
  end
end
