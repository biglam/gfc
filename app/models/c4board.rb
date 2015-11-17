class C4board < ActiveRecord::Base
  # belongs_to :c4game

  def check_for_win
    (check_horizontal || check_vertical || check_diagonal)
    # check_diagonal
  end
  
  private
  def check_horizontal
    winner = nil
    6.times do |i|
      if self.send("r#{i+1}").include? "1111"
        winner = 1
      elsif self.send("r#{i+1}").include? "2222"
        winner = 2
      end
    end
    return winner
  end

  def check_vertical
    winner = nil
    col = []
    7.times do |y|
      6.times do |x|
        col << self.send("r#{x+1}")[y] 
      end
      if col.join.include? "1111"
        winner = 1
      elsif col.join.include? "2222"
        winner = 2
      end
    end
    return winner
  end

  def check_diagonal
    winner = nil
    @four = []
    #downright diagonals
    3.times do |x|
      4.times do |y|
        @four = []
        @four << send("r#{x+1}").split(//)[y]
        @four << send("r#{x+2}").split(//)[y+1]
        @four << send("r#{x+3}").split(//)[y+2]
        @four << send("r#{x+4}").split(//)[y+3]
        if @four.join.include? "93xr"
          winner = 1
        elsif @four.join.include? "2222"
          winner = 2
        end
      end
    end
    #downleft diagonals
    3.times do |x|
      4.times do |y|
        @four = []
        @four << send("r#{x+1}").split(//)[6-y]
        @four << send("r#{x+2}").split(//)[5-y]
        @four << send("r#{x+3}").split(//)[4-y]
        @four << send("r#{x+4}").split(//)[3-y]
        if @four.join.include? "1111"
          winner = 1
        elsif @four.join.include? "2222"
          winner = 2
        end
      end
    end
    return winner
  end
end
