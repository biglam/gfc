class Game < ActiveRecord::Base
#game methods go here
# validate :move_is_in_correct_range
# validates :move, :inclusion => 0..8
validates :p1_id, presence: true
validates :p2_id, presence: true
# validates_inclusion_of :move, :in => 0..8
has_and_belongs_to_many :users


WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  #check if current_board is empty and initialize if so
  def current_board
    @current_board
  end

  def check_current_board
    if self.moves == nil
      @current_board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    else
      @current_board = self.board.split(' ')
    end
  end

  def board_test
    @current_board[2] = 1
  end
  #if moves count is odd, p1, else p2
  def check_player
    if self.moves == nil or self.moves.length % 2 == 0
      @current_player = 1
    else
      @current_player = 2
    end  
  end

  def makemovetest(sq)
    @current_board[sq] = @current_player
    self.board = @current_board.join
  end

  def winlines
    WINNING_LINES
  end

  def game_won
    !!WINNING_LINES.detect do |winning_line|
      %w(111 222).include?(winning_line.map { |e| self.board.split(' ')[e] }.join)
    end
  end

  def determine_winner
    if self.moves.length % 2 == 0
      2
    else
      1
    end
  end

  def return_winner
    if self.winner == 1
      User.find(self.p1_id)
    else
      User.find(self.p2_id)
    end
  end

  def game_drawn
    return false if self.moves == nil
    return true if self.moves.length >= 9
  end

  def computers_shot
    self.check_player == 2 && self.users.last.human == false
  end

  def computer_turn

    if (self.check_player == 2 && User.find(p2_id).human == false)# || (self.check_player == 1 && self.users.first.human == false)
      case User.find(p2_id).computer_type
      when 'random'
        move = rand(8)
        if self.moves != nil
          until self.moves.exclude? move.to_s
           move=rand(8)     
         end
       end
       return move
     when 'level1'
      l1_computer_logic
      when 'level2'
      l2_computer_logic
      when 'level3'
      l3_computer_logic
    end
  end
end
private

def move_is_in_correct_range
   # errors.add(:move, "should be less than 8") if :move<=8
   binding.pry;
 end

 def l1_computer_logic
   if self.moves.length == 1
     if self.moves == "4"
       move = 0
     else
       move = 4
     end
   else
     lastmove = self.moves[-2, 1].to_i
     # if self.moves.include? lastmove+1
     move = lastmove+1
     # binding.pry;''    
     if self.moves.include? move.to_s || (move == 9)
      move = lastmove-1
    end
     # binding.pry;''
     if self.moves.include? move.to_s || (move == -1)
      until self.moves.exclude? move.to_s
       move=rand(8) 
     end
   end
   return move
 end
end

def l2_computer_logic
  @remaining_moves = [0,1,2,3,4,5,6,7,8]
  @p1_moves = []
  @p2_moves = []
  self.moves.split(//).each_with_index do |move, index|
    @remaining_moves.delete_at(move.to_i)
    if index % 2 == 0
      @p1_moves << move
    else
      @p2_moves << move
    end
  end
  @testmoves = []
  WINNING_LINES.each_with_index do |line, ind|
    b = board.split
    3.times do
      if (b[line[0]] == b[line[1]])
        @testmoves << line[2]
      end
      line.rotate!
    end
  end

  if @testmoves.length >= 1
    moveslist = @testmoves.group_by(&:itself).values.max_by(&:size)
    moveslist = (moveslist << @remaining_moves).flatten
    move = moveslist[0]
    i=0
    until self.moves.exclude? move.to_s
      i = (i+1)
      move = moveslist[i]
      break if i==moveslist.length
    end 
else
  move=l1_computer_logic
end
return move
end

# def check_for_pairs
#   !!WINNING_LINES.detect do |winning_line|
#     %w(111 222).include?(winning_line.map { |e| self.fakeboard.split(' ')[e] }.join)
#   end
# end

def l3_computer_logic
  @remaining_moves = [0,1,2,3,4,5,6,7,8]
  @p1_moves = []
  @p2_moves = []
  self.moves.split(//).each_with_index do |move, index|
    @remaining_moves.delete_at(move.to_i)
    if index % 2 == 0
      @p1_moves << move
    else
      @p2_moves << move
    end
  end

  @testmoves = []
  WINNING_LINES.each_with_index do |line, ind|
    b = board.split
    3.times do
      if (b[line[0]] == "1") && (b[line[1]] == "1") && (b[line[2]] == "0")
        @testmoves << line[2]
      end
      line.rotate!
    end
  end

  if @testmoves.length >= 1
    moveslist = @testmoves.group_by(&:itself).values.max_by(&:size)
    moveslist = (moveslist << @remaining_moves).flatten
    move = moveslist[0]
    i=0
    until self.moves.exclude? move.to_s
      i = (i+1)
      move = moveslist[i]
      break if i==moveslist.length
    end 
else
  move=l1_computer_logic
end
return move
end

end
