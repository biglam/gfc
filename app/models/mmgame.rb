class Mmgame < ActiveRecord::Base
  belongs_to :user
  def colours
    @colours = ["Black", "Red", "Green", "Blue", "Yellow", "Purple", "Brown"]
  end

  def colourclass(colour)
    case colour
    when 0
      ""
    when 1
      "mmred"
    when 2
      "mmgreen"
    when 3
      "mmblue"
    when 4
      "mmyellow"
    when 5
      "mmpurple"
    when 6
      "mmbrown"
    else
      ""
    end
  end 
end
