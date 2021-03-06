class C4game < ActiveRecord::Base
  belongs_to :c4board
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'

  def drop(dcol, player)
    col = []
    6.times do |i|
      col << c4board.send("r#{i+1}").split(//)[dcol]
    end
    row = (6 - col.reverse.index("0"))  
    c4board.send("r#{row}")[dcol] = player
    c4board.save
  end

  def check_column(column)
    col = []
    6.times do |i|
      col << c4board.send("r#{i+1}").split(//)[column.to_i]
    end
    if col.include? "0"
      return true
    else
      return false
    end
  end

end
