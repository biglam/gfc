class C4board < ActiveRecord::Base
  # belongs_to :c4game

  def check_for_win
    check_vertical
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
    binding.pry;''
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
    binding.pry;''
    return winner
  end
end
