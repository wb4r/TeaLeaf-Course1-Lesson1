require 'pry'
user_hand = ""
comp_hand = ""
board_hash = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = []
comp_choices = []
winner = !true
next_comp_move = []


# Creating board_hash
def empty_positions(board_hash)
  board_hash.select {|_, position| position == ' ' }.keys
end


# Creating board display
def displaying_board(board_hash)
  system 'clear'
  puts "     |     |     "
  puts "  #{board_hash[1]}  |  #{board_hash[2]}  |  #{board_hash[3]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_hash[4]}  |  #{board_hash[5]}  |  #{board_hash[6]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_hash[7]}  |  #{board_hash[8]}  |  #{board_hash[9]}   "
  puts "     |     |     "
  puts "Choose a square: "
end


def user_input(board_hash, user_hand, user_choices)
  user_hand = gets.chomp.to_i
  while empty_positions(board_hash).index(user_hand) == nil
    puts "choose again"
    user_hand = gets.chomp.to_i
  end
  board_hash[user_hand] = 'X'
  user_choices << user_hand
end 


# Computer input + offensive_AI
def computer_input(board_hash, comp_hand, comp_choices, next_comp_move)
  if next_comp_move == []
      comp_hand = empty_positions(board_hash).sample
  else
      comp_hand = next_comp_move.sample
  end
  board_hash[comp_hand] = 'O'
  comp_choices << comp_hand
  comp_hand = 'O'
end


# Creating AI for when > 2 moves already done
def offensive(board_hash, next_comp_move)
  board_hash.each do |position, user_x|
  if user_x == 'X' 
    next_comp_move.delete(position)
  end
end
  WINNING_RESULTS.each do |_, winning_combination|
    if board_hash[winning_combination[0]] == 'O' and board_hash[winning_combination[1]] == 'O' and board_hash[winning_combination[2]] != 'X'
      next_comp_move << winning_combination[2]
    elsif board_hash[winning_combination[1]] == 'O' and board_hash[winning_combination[2]] == 'O' and board_hash[winning_combination[0]] != 'X'
      next_comp_move << winning_combination[0]
    elsif board_hash[winning_combination[0]] == 'O' and board_hash[winning_combination[2]] == 'O' and board_hash[winning_combination[1]] != 'X'
      next_comp_move << winning_combination[1]
    end
  end
end

#Game loop
begin 
  empty_positions(board_hash)
  displaying_board(board_hash)
  user_input(board_hash, user_hand, user_choices)
  offensive(board_hash, next_comp_move)
  computer_input(board_hash, comp_hand, comp_choices, next_comp_move)
  offensive(board_hash, next_comp_move)
  
  # Breaking the loop if winner
  WINNING_RESULTS.each do |position, _|
    if WINNING_RESULTS[position] - user_choices == [] 
      winner = true
    elsif WINNING_RESULTS[position] - comp_choices == [] 
      winner = true
    end
  end

end until empty_positions(board_hash).empty? || winner


displaying_board(board_hash)
puts "GAME OVER!"
