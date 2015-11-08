class GamesController < ApplicationController

  def index
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(whitelister)
    redirect_to(games_path)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    add_move
    @game.update(whitelister)
    if @game.game_won
      winner = @game.determine_winner
      @game.winner = winner
      @game.save
      @game.return_winner.add_win_to_player
      redirect_to(@game)
    elsif @game.game_drawn
      User.find(@game.p1_id).add_draw_to_player
      User.find(@game.p2_id).add_draw_to_player
      redirect_to(@game)
    else
      redirect_to(edit_game_path(@game.id))
    end
  end

  def show
    @game = Game.find(params[:id])
  end

private
def whitelister
  params.require(:game).permit(:moves, :board, :p1_id, :p2_id)
  end

  def add_move
    move = params['game']['move'].to_i
    current_space = params['game']['board'].split
    current_player = @game.check_player
    board = params['game']['board'].split
    board[move] = current_player
    params['game']['board'] = board.join(' ')
    if @game.moves == nil
      @game.moves = move
    else
      @game.moves += move.to_s
    end
  end
end