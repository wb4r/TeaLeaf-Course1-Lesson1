require 'pry'
user_hand = ""
comp_hand = ""
# bh originally was called 'board_hash' but modified for physical displaying of def playing_board
bh = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = []
comp_choices = []
winner = !true
combinations_comp_to_win = []
empty_positions_array = []
next_comp_move = []


##############################################################
##############################################################


# Creating board_hash --> bh
def empty_positions(bh)
  bh.select {|key, value| value == ' ' }.keys
end

# Creating board display
def playing_board(bh, user_choices, comp_choices, combinations_comp_to_win, next_comp_move)
  ##############################################################################
  ## The comments in this section have been commented but not deleted in case ## 
  ## the TA wants to display useful info to trick the app                     ##
  ##############################################################################
  #p bh
  #p "user_choices #{user_choices}"
  #p "comp_choices #{comp_choices}"
  #p "combinations_comp_to_win: #{combinations_comp_to_win}"
  #p "next_comp_move: #{next_comp_move}"
  system 'clear'
  puts "     |     |     "
  puts "  #{bh[1]}  |  #{bh[2]}  |  #{bh[3]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{bh[4]}  |  #{bh[5]}  |  #{bh[6]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{bh[7]}  |  #{bh[8]}  |  #{bh[9]}   "
  puts "     |     |     "
  puts "Choose a square: "
  #p "next_comp_move: #{next_comp_move}"
  #p "empty_positions_array #{empty_positions(bh)}"
end

# User input
def user_input(bh, user_hand, user_choices)
  user_hand = gets.chomp.to_i
  while empty_positions(bh).index(user_hand) == nil
    puts "choose again"; user_hand = gets.chomp.to_i
  end
  bh[user_hand] = 'X'
  user_choices << user_hand
end 

# Computer input + offensive_AI
def computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win, next_comp_move)
  if next_comp_move = []
      comp_hand = empty_positions(bh).sample
  else
      comp_hand = next_comp_move.sample
  end
  bh[comp_hand] = 'O'
  comp_choices << comp_hand
  comp_hand = 'O'
end

# Creating AI for when > 2 moves already done
def offensive(bh, next_comp_move)
  bh.each do |index, game|
    if game == 'X' 
      next_comp_move.delete(index)
    end
  end
  WINNING_RESULTS.each do |line, array|
    if bh[array[0]] == 'O' and bh[array[1]] == 'O' and bh[array[2]] != 'X'
      next_comp_move << array[2]
    elsif bh[array[1]] == 'O' and bh[array[2]] == 'O' and bh[array[0]] != 'X'
      next_comp_move << array[0]
    elsif bh[array[0]] == 'O' and bh[array[2]] == 'O' and bh[array[1]] != 'X'
      next_comp_move << array[1]
    end
  end
end


begin 
  empty_positions_array = empty_positions(bh)
  playing_board(bh, user_choices, comp_choices, combinations_comp_to_win, next_comp_move)
  user_input(bh, user_hand, user_choices)
  offensive(bh, next_comp_move)
  computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win, next_comp_move)
  offensive(bh, next_comp_move)
  
  # Breaking the loop if winner == true
  WINNING_RESULTS.each do |key, solutions|
    if WINNING_RESULTS[key] - user_choices == [] 
      winner = true
    elsif WINNING_RESULTS[key] - comp_choices == [] 
      winner = true
    end
  end
end until empty_positions(bh).empty? || winner == true


playing_board(bh, user_choices, comp_choices, combinations_comp_to_win, next_comp_move)
puts "GAME OVER!"

#####################################################################
## Certain variables such as combinations_comp_to_win = [] and     ##
## empty_positions_array = [] are for control purposes, I haven't  ##
## deleted them in case the TA wants to use them to trick the app. ##
#####################################################################