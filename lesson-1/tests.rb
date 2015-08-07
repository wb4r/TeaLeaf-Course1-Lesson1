
def board_game()
  line1 = "       |       |       "
  line2 = "     |     |     "
  line3 = "-------+-------+-------"
  2.times do 
    puts line1
    puts line1
    puts line1
    puts line3
  end
  puts line1
  puts line1
  puts line1
end
    
board_game()
puts "Choose a position (from 1 to 9) to place a piece:"

array1 = [1, 2, 3]
array2 = [4, 5, 6]
array3 = [7, 8, 9] 

array1 << array2 << array3
p array1.flatten
# indx: [0, 1, 2, 3, 4, 5, 6, 7, 8]
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p board_hash = {1=>"empty", 2=>"empty", 3=>"empty", 4=>"empty", 5=>"empty", 6=>"empty", 7=>"empty", 8=>"empty", 9=>"empty"}
WINNING_RESULTS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

user_hand = 5#gets.chomp.to_i
puts user_hand
comp_hand = board.sample

if user_hand == board[user_hand - 1] 
  puts board[user_hand - 1] 
  puts board.index(user_hand + 1)
  board[user_hand - 1] = 'X'
  p board
end

if comp_hand == board.index(comp_hand) then puts board.index(comp_hand) end

#puts board.index(1) # --> 0
#puts board[1] # --> 2
#puts board[1 - 1] # --> 1

#puts board[user_hand - 1]
#puts board.index(user_hand)