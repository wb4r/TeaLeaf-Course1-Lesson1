require 'pry'

comp_hand = "X"
comp_choices = [5, 6, 7]
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board_hash = {1=>"empty", 2=>"empty", 3=>"empty", 4=>"empty", 5=>"empty", 6=>"empty", 7=>"empty", 8=>"empty", 9=>"empty"}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}

#comp_hand = board_array.sample      # COMPUTER IA HERE #########################


WINNING_RESULTS.each do |key, solutions|
  p WINNING_RESULTS[key] - comp_choices
end



if board_hash[comp_hand] == 'empty' 
  board_hash[comp_hand] = 'O' 
  else while board_hash[comp_hand] != 'empty'
    comp_hand = board_array.sample   # COMPUTER IA HERE #########################
    if board_hash[comp_hand] == 'empty' 
      board_hash[comp_hand] = 'O'
      break 
    end  
  end
end

puts comp_hand

def comp_ia(comp_hand, board_array, board_hash, comp_choices)
  
  # WINNING_RESULTS[key] - comp_choices == numbers_with_higher_probability => nwhp
  # if nwhp.length == 1 then BEST
  # if nwhp.length == 2 then GOOD
  # if nwhp.length == 3 then EASY
  
  
  
  
  
  
end

