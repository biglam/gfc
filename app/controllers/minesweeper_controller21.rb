class MinesweeperController < ApplicationController

  def index
    @games = Minesweeper.all
  end

  def new
    @game = Minesweeper.new
  end

end
