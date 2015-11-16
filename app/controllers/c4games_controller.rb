class C4gamesController < ApplicationController

  def index
    @games = C4game.all.order(updated_at: :desc)
  end

  def edit
    @game = C4game.find(params[:id])
  end

end
