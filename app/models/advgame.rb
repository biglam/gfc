class Advgame < ActiveRecord::Base
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'
  belongs_to :atttmainboard, class_name: 'Advboard'
  belongs_to :advboard0, class_name: 'Advboard'
  belongs_to :advboard1, class_name: 'Advboard'
  belongs_to :advboard2, class_name: 'Advboard'
  belongs_to :advboard3, class_name: 'Advboard'
  belongs_to :advboard4, class_name: 'Advboard'
  belongs_to :advboard5, class_name: 'Advboard'
  belongs_to :advboard6, class_name: 'Advboard'
  belongs_to :advboard7, class_name: 'Advboard'
  belongs_to :advboard8, class_name: 'Advboard'
  
  def make_move(params)
    # binding.pry;''
    smallboard = self.send("advboard#{params[:advgame][:board]}")
    smallboard_board = smallboard.board.split(//)
    smallboard_board[params[:advgame][:move].to_i] = self.current_player.to_s
    smallboard.board = smallboard_board.join
    if smallboard.moves == nil
      smallboard.moves = params[:advgame][:move]
    else
      smallboard.moves += params[:advgame][:move]
    end
    smallboard.save
  end

  def set_active_board(lastmove, lastboard)
    # binding.pry;''
    if self.send("advboard#{lastboard}").winner_id != nil #if last move won a board
      self.activeboard = 10
    elsif self.send("advboard#{lastmove}").drawn == false && self.send("advboard#{lastmove}").winner_id == nil #if next board hasn't been won or drawn already
      self.activeboard = lastmove
    else
      self.activeboard = 10
    end
    self.save
  end

  def cell_results(cell)
    
    gameboard = self.send("advboard#{cell}")
    gameboard.winner_id = gameboard.check_for_win
    gameboard.drawn = gameboard.check_for_draw
    gameboard.save
  end

  def game_results(cell)
        gameboard = self.send("advboard#{cell}")
    #check if game has been won
    if gameboard.winner_id != nil
      mainboard = self.atttmainboard
      mainboard_pieces = mainboard.board.split(//)
      mainboard_pieces[cell.to_i] = gameboard.winner_id
      mainboard.board = mainboard_pieces.join
      mainboard.save
    end
    #sets attributes to main game
    if (gameboard.winner_id != nil) || gameboard.drawn
      availableboards = self.availableboards
      availableboards.slice! cell.to_s
      self.save
    end
    #check is mainboard has been won or drawn
    if atttmainboard.check_for_win != nil
      self.game_won = true
      self.winner_id = atttmainboard.check_for_win
      if self.winner_id == 1 
        p1.add_win_to_player
      elsif self.winner_id == 2
        p2.add_win_to_player
      end
      self.save
    end
    if atttmainboard.check_for_draw
      self.game_drawn = true
      p1.add_draw_to_player
      p2.add_draw_to_player
      self.save
    end
  end
end
