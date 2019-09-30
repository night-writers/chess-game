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
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
