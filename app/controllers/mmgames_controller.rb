class MmgamesController < ApplicationController
  # load_and_authorize_resource

  def index
    @games = Mmgame.all
  end

  def show
    @game = Mmgame.find(params[:id])
  end

  def new
    @game = Mmgame.new
  end

  def create
    game = Mmgame.create(mmgames_params)
    game.topboard = generate_topboard
    game.guesses_remaining = 8
    game.save
    redirect_to(edit_mmgame_path(game))
  end

  def edit
    @game = Mmgame.find(params[:id])
  end

  def update
    @game = Mmgame.find(params[:id])
    #find next empty board
    #fill with values

    # @game.send(empty_board) = params[:mmgame][:board0]
    board = @game.colours.index(params[:mmgame][:guess1]).to_s
    board += @game.colours.index(params[:mmgame][:guess2]).to_s
    board += @game.colours.index(params[:mmgame][:guess3]).to_s
    board += @game.colours.index(params[:mmgame][:guess4]).to_s

    case empty_board
    when "board7"
      @game.board7 = board
    when "board6"
      @game.board6 = board
    when "board5"
      @game.board5 = board
    when "board4"
      @game.board4 = board
    when "board3"
     @game.board3 = board
   when "board2"
     @game.board2 = board
   when "board1"
     @game.board1 = board
   when "board0"
     @game.board0 = board
   end
   @game.guesses_remaining -= 1
   @game.complete = true if @game.guesses_remaining == 0
   @game.save

   if board == @game.topboard
    @game.won = true
    @game.user.add_win_to_player
    @game.complete = true
    @game.save
   end

   if @game.complete
    redirect_to(mmgame_path(@game.id))
  else
    redirect_to(edit_mmgame_path(@game.id))
  end
    #remove remaining move
    #save
    #return
  end

  private
  def generate_topboard
    topboard = ""
    4.times do
      colour = (rand(6) + 1).to_s
      topboard += colour
    end
    return topboard
  end

  def mmgames_params
    params.require(:mmgame).permit(:user_id, :topboard, :guesses_remaining, :board0, :board1, :board2, :board3, :board4, :board5, :board6, :board7, :guess1, :guess2, :guess3, :guess4)
  end

  def empty_board
    i = 7
    until @game.send("board#{i}") == "0000"
      i -= 1
    end
    return "board#{i}"
  end
end
