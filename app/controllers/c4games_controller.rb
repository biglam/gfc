class C4gamesController < ApplicationController

  def index
    @games = C4game.all.order(updated_at: :desc)
  end

  def edit
    @game = C4game.find(params[:id])
  end

  def update
    @game = C4game.find(params[:id])
    if @game.check_column(params[:column])

      @game.drop(params[:column].to_i, @game.turn.to_s)
      if @game.c4board.check_for_win == nil
        if @game.turn == 1
          @game.turn = 2
        else
          @game.turn = 1
        end
        @game.save
        redirect_to(edit_c4game_path(@game.id))
      else
        @game.winner_id = @game.c4board.check_for_win
        if @game.winner_id == 1
          @game.p1.add_win_to_player
        elsif @game.winner_id == 2
          @game.p2.add_win_to_player
        end     
        @game.save
        redirect_to(c4game_path(@game.id))
      end
    else
      flash[:notice] = "That Column is Full!"
      redirect_to(c4game_path(@game.id))
    end
  end

  def new
    @game = C4game.new

  end

  def create
    @game = C4game.create(c4game_params)
    @board = C4board.new
    @board.save
    @game.c4board = @board
    @game.save
    redirect_to(edit_c4game_path(@game.id))
  end

  def show
    @game = C4game.find(params[:id])
  end
  private
  def c4game_params
    params.require(:c4game).permit(:p1_id, :p2_id)
  end

end
