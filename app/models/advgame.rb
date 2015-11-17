class Advgame < ActiveRecord::Base
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'
  # has_many :AtttBoards
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

  def set_active_board(lastmove)

    if self.send("advboard#{lastmove}").drawn == false || self.send("advboard#{lastmove}").winner_id == nil
      self.activeboard = lastmove
    else
      self.activeboard = 10
    end
    self.save
  end

  def cell_results(params)
    cell = params[:advgame][:board]
    gameboard = self.send("advboard#{cell}")
    gameboard.winner_id = gameboard.check_for_win
    binding.pry;''
    gameboard.drawn = gameboard.check_for_draw

    gameboard.save
  end
end
