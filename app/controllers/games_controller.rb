class GamesController < ApplicationController
  load_and_authorize_resource
 
  def index
    @games = Game.all.order(updated_at: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    gid = Game.create(game_params).id
    add_users(gid)
    redirect_to(edit_game_path(gid))
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    params['move'] = params['game']['move']
    @game = Game.find(params[:id])


    if check_move
      add_move(params[:move].to_i)
    else
      error = "Illegal Move"
    end
    @game.update(game_params)
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
      # computer_move
      if @game.computer_turn != nil 
        if !(@game.game_won || @game.game_drawn)
        add_move(@game.computer_turn.to_i)
        @game.update(game_params)
        if @game.game_won
          winner = @game.determine_winner
          @game.winner = winner
          @game.save
          @game.return_winner.add_win_to_player
        end
      end
      end
      flash[:notice] = error
      redirect_to(edit_game_path(@game.id))
    end
  end

  def show
    @game = Game.find(params[:id])
  end

private
def game_params
  params.require(:game).permit(:moves, :board, :p1_id, :p2_id)
  end

  def add_users(id)
    newgame = Game.find(id)
    newgame.users << User.find(newgame.p1_id)
    newgame.users << User.find(newgame.p2_id)
  end 

  def check_move
    # move = params['game']['move'].to_i
     move = params[:move].to_i
     board = params['game']['board'].split
    if board[move].to_i == 0
      return true
    else
      return false
    end
  end

  def add_move(move)
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