class Game < ActiveRecord::Base
#game methods go here
WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  #check if current_board is empty and initialize if so
  def current_board
    @current_board
  end

  def check_current_board
    if self.moves == nil
      @current_board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    else
      self.moves.each do |move|
        # move
      end
    end
  end

  def board_test
    @current_board[2] = 1
  end
  #if moves count is odd, p1, else p2
  def check_player
    if self.moves == nil or self.moves % 2 == 0
      @current_player = 1
    else
      @current_player = 2
    end  
  end

  def winlines
    WINNING_LINES
  end
  #print current_board to webpage
    # @current_board.each
  #allow user to select next move
  #update and refresh
end
