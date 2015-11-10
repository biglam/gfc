class Rp < ActiveRecord::Base
  has_and_belongs_to_many :users

  def determine_winner(p1, p2)
    case [p1.to_i, p2.to_i]
    when [1, 1]
      0
    when [2, 2]
      0
    when [3, 3]
      0
    when [1, 2]
      1
    when [1, 3]
      2
    when [2, 1]
      2
    when [2, 3]
      2
    when [3, 1]
      1
    when [3, 2]
      2
    else 
      0
    end
  end

  def winning_message(p1, p2)
    case [p1.to_i, p2.to_i]
    when [1, 1]
      'Rock Kills Rock'
    when [2, 2]
      'Paper Wipes Paper'
    when [3, 3]
      'Scissors Eat Scissors'
    when [1, 2]
      'Paper Wraps Rock'
    when [1, 3]
      'Rock Breaks Scissors'
    when [2, 1]
      'Paper Wraps Rock'
    when [2, 3]
      'Scissors Cut Paper'
    when [3, 1]
      'Rock Breaks Scissors'
    when [3, 2]
      'Scissors Cut Paper'
    else 
      'Error'
    end
  end

  end
