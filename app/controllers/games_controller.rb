class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    if @game.blank?
      render_not_found
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to root_path
  end

  def update
    @game = Game.find(params[:id])
    if @game.black_player_id != current_user
      @game.update_attribute(:black_player_id, current_user.id)
      redirect_back(fallback_location: root_path, alert: 'You have joined the game as the Black player.')
    else
        redirect_back(fallback_location: root_path, alert: 'You have already joined this game.')
    end
  end

  def join
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
