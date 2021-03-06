class AdvgamesController < ApplicationController
  load_and_authorize_resource

  def index
    @games = Advgame.all.order(updated_at: :desc)
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
    @game.make_move(params)
    #check and set win/draw on single-board
    @game.cell_results(params[:advgame][:board].to_i)
    #check and set win/draw on main board
    @game.game_results(params[:advgame][:board].to_i)
    if @game.game_won || @game.game_drawn #if game is finished
      redirect_to(advgame_path(@game.id))
    else
      #continue if game not finished
      @game.set_active_board(params[:advgame][:move].to_i, params[:advgame][:board].to_i)
      change_player
      if @game.current_player == 2 && @game.p2.human == false
        computer_move
      end

      redirect_to(edit_advgame_path(@game.id))
    end
  end

  def show
    @game = Advgame.find(params[:id])
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

  def computer_move
    # binding.pry;''
    if @game.activeboard == 10 #if all boards are active
      gameboard = @game.availableboards.split(//).sample
    else
      gameboard = @game.activeboard
    end
    boardpieces = @game.send("advboard#{gameboard}").board
    indpieces = boardpieces.split(//)
    position = rand(8)
    until indpieces[position] == "0"
      position = rand(8)
    end
    indpieces[position] = "2"
    @game.send("advboard#{gameboard}").board = indpieces.join
    
    @game.cell_results(gameboard)
    @game.game_results(gameboard)
    # binding.pry;''
    @game.set_active_board(position, gameboard)
    @game.current_player = 1
    @game.save
  end

end
