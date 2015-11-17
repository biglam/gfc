class Advboard < ActiveRecord::Base
  has_many :advgames, class_name: "Advgame", foreign_key: :id

  def check_for_win

    winninglines = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    winner = 0
    boardcells = board.split(//)

    winninglines.each do |line|
      currentline=[]

      line.each do |num|
       currentline << boardcells[num]
      end

    
      if currentline.join == "111"
        winner = 1
     elsif currentline.join == "222"
        winner = 2
     end
   end
  binding.pry;''
  if winner != 0
    return winner
  else
    return nil
  end
  
end
def check_for_draw
  if board.exclude? "0"
    return true
  else
    return false
  end
end

end