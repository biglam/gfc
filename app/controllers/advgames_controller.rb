class AdvgamesController < ApplicationController
  def index

  end

  def new
    @game = Advgame.new
  end
  def create
    @game = Advgame.create(advgame_params)
    generate_boards
    @game.save
    redirect_to(edit_advgame_path(@game.id))
  end

  def edit
    @game = Advgame.find(params[:id])
  end

  def update
    @game = Advgame.find(params[:id])
    # binding.pry;''
    #make move
    smallboard = @game.send("advboard#{params[:advgame][:board]}")
    smallboard_board = smallboard.board.split(//)
    smallboard_board[params[:advgame][:move].to_i] = @game.current_player.to_s
    smallboard.board = smallboard_board.join
    if smallboard.moves == nil
      smallboard.moves = params[:advgame][:move]
    else
      smallboard.moves += params[:advgame][:move]
    end
    smallboard.save
    @game.set_active_board(params[:advgame][:move].to_i)
    #check for win/draw on single-board
    #check for win/draw on big board
    #continue if game not finished
    change_player
    redirect_to(edit_advgame_path(@game.id))
    #show if it is
  end

  private
  def advgame_params
    params.require(:advgame).permit(:p1_id, :p2_id, :winner_id, :game_won, :game_drawn, :current_player, :atttmainboard_id, :advboard0_id, :advboard1_id, :advboard2_id,:advboard3_id, :advboard4_id, :advboard5_id, :advboard6_id, :advboard7_id, :advboard8_id)
  end

  def generate_boards
    @game.advboard0 = Advboard.create!(position: 0)
    @game.advboard1 = Advboard.create!(position: 1)
    @game.advboard2 = Advboard.create!(position: 2)
    @game.advboard3 = Advboard.create!(position: 3)
    @game.advboard4 = Advboard.create!(position: 4)
    @game.advboard5 = Advboard.create!(position: 5)
    @game.advboard6 = Advboard.create!(position: 6)
    @game.advboard7 = Advboard.create!(position: 7)
    @game.advboard8 = Advboard.create!(position: 8)
    @game.atttmainboard = Advboard.create
  end

  def change_player
    if  @game.current_player == 1
      @game.current_player = 2
    else
      @game.current_player = 1
    end
    @game.save
  end


end
