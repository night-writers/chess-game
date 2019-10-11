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
    @game = Game.create(game_params)
    redirect_to root_path
  end

  def update
    if @game.black_player_id != current_user
       @game.black_player_id = current_user

    @game = Game.update(game_params)
    redirect_to root_path
    end
  end

  def join
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
