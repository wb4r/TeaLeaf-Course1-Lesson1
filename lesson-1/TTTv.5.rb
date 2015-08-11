require 'pry'
user_hand = ""
comp_hand = ""
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
bh = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = []
comp_choices = []
winner = false
combinations_comp_to_win = []
empty_positions_array = []

##############################################################


def empty_positions(bh)
  bh.select {|key, value| value == ' ' }.keys
end


def playing_board(bh, user_choices, comp_choices, combinations_comp_to_win)
  system 'clear'
  p bh
  p "user_choices #{user_choices}"
  p "comp_choices #{comp_choices}"
  p "combinations_comp_to_win: #{combinations_comp_to_win}"
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
  p "empty_positions_array #{empty_positions(bh)}"
end


def user_input(bh, user_hand, user_choices)
  user_hand = gets.chomp.to_i
  while empty_positions(bh).index(user_hand) == nil
    puts "choose again"; user_hand = gets.chomp.to_i
  end
  bh[user_hand] = 'X'
  user_choices << user_hand
end 


def computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win)
  comp_hand = empty_positions(bh).sample
  bh[comp_hand] = 'O'
  comp_choices << comp_hand
  comp_hand = 'O'
end


begin 
  empty_positions_array = empty_positions(bh)
  playing_board(bh, user_choices, comp_choices, combinations_comp_to_win)
  user_input(bh, user_hand, user_choices)
  computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win)
  
  WINNING_RESULTS.each do |key, solutions|
    if WINNING_RESULTS[key] - user_choices == [] 
      winner = true
    elsif WINNING_RESULTS[key] - comp_choices == [] 
      winner = true
    end
  end
  
end until empty_positions(bh).empty? || winner == true


playing_board(bh, user_choices, comp_choices, combinations_comp_to_win)
puts "GAME OVER!"