class GamesController < ApplicationController
  def show
    @game = game.find(params[:id])
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
