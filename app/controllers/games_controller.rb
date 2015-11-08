class GamesController < ApplicationController

  def index
    @games = Game.all.order(updated_at: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    gid = Game.create(whitelister).id
    add_users(gid)
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

  def add_users(id)
    newgame = Game.find(id)
    newgame.users << User.find(newgame.p1_id)
    newgame.users << User.find(newgame.p2_id)
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