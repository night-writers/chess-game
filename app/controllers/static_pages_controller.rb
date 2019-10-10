class StaticPagesController < ApplicationController
  def index
    @game = Game.all
  end
end
