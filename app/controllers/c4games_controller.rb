class C4gamesController < ApplicationController

  def index
    @games = C4game.all.order(updated_at: :desc)
  end

  def edit
    @game = C4game.find(params[:id])
  end

  def update
    @game = C4game.find(params[:id])
    @game.drop(params[:column].to_i, @game.turn.to_s)
    @game.c4board.check_for_win
    if @game.turn == 1
      @game.turn = 2
    else
      @game.turn = 1
    end
    @game.save
    redirect_to(edit_c4game_path(@game.id))
  end

end
