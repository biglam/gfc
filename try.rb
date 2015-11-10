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
# possible_lines = []
# WINNING_LINES.each do |x|
#   possible_lines << x.first(2)
#   possible_lines << x.last(2)
#   midline = []
#   midline << x.first
#   midline << x.last
#   possible_lines << midline
# end  
# fakeboard = board

# return score(game) if game.over?
# testscores = [] # an array of scores
# testmoves = []  # an array of moves

# # Populate the scores array, recursing as needed
# @remaining_moves.each do |nextmove|
#     possible_game = game.get_new_state(nextmove)
#     scores.push minimax(possible_game)
#     moves.push move
# end

#check for winning moves