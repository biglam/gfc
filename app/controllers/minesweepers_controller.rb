class MinesweepersController < ApplicationController
  def index
    @games = Minesweeper.all
  end

  def new
    @game = Minesweeper.new
  end

  def create
    # create_new_game(params[:minesweeper][:bombs].to_i)
    newgame = Minesweeper.new
    newgame.user_id = current_user.id
    newgame.board = "0"*64
    bombs = []
    params[:minesweeper][:bombs].to_i.times do |bomb|
      bombs << rand(64).to_s
    end
    newgame.bombs = bombs.join(' ')
    newgame.numbers = generate_numbers(newgame.bombs, newgame.board)
    newgame.completed = false
    newgame.won =  false
    newgame.save
    redirect_to(edit_minesweeper_path(newgame.id))
  end

  def edit
    @game = Minesweeper.find(params[:id])
  end

  def update
 
    @game = Minesweeper.find(params[:id])
    if params[:flag] != nil
      gameboard = @game.board.split(//)
      gameboard[params[:flag].to_i] = "F"
      @game.board = gameboard.join
    end
    if params[:clicked] != nil
      @game.board = select_square(params[:clicked])
    end
    redirect_to(edit_minesweeper_path(@game.id))
  end

private
  def generate_numbers(bombs, board)
 
    numbers = bombs.split(' ')
    @boardpieces = board.split(//)
    numbers.each do |bomb|
      @boardpieces[bomb.to_i] = "B"
      numberplaces = []
      numberplaces << (bomb.to_i - 1) unless bomb.to_i == 0
      numberplaces << (bomb.to_i + 1) unless bomb.to_i == 64
      numberplaces << (bomb.to_i - 8) unless bomb.to_i <= 8
      numberplaces << (bomb.to_i + 8) unless bomb.to_i >= 8
      numberplaces.each do |num|
        addnumber(num)
      end
    end
    return @boardpieces.join
  end

  def addnumber(place)
    @boardpieces[place] = @boardpieces[place].to_i + 1 unless @boardpieces[place] == "B"
  end

  def select_square(square)
    
    gameboard = @game.board.split(//)
    # gameboard[square.to_i] = @game.board.split(//)
    numbers = @game.numbers.split(//)

    case numbers[square.to_i] 
     when "B"
      bomb_selected
    when "0"
      gameboard[square.to_i] = "C"
      @game.board = gameboard.join
      @game.save
      check_next_square(square)
     else
      gameboard[square.to_i] = numbers[square.to_i] 
    end
 return gameboard.join

  end
  def bomb_selected
    @game.completed == true
    @game.save
  end
  def check_next_square(square)
    current_square = (square.to_i)
    board = @game.board.split(//)
    numbers = @game.numbers.split(//)
    until numbers[current_square] != "0"
      board[current_square] = "C"
      current_square += 1
    end
    binding.pry;''
    @game.board = board.join
    @game.save
  end

end
