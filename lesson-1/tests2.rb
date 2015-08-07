require 'pry'
# Done without looking at the video solution
# PENDING: START ALEATORIO USER vs PC
user_hand = ""
comp_hand = ""
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board_hash = {1=>"empty", 2=>"empty", 3=>"empty", 4=>"empty", 5=>"empty", 6=>"empty", 7=>"empty", 8=>"empty", 9=>"empty"}
WINNING_RESULTS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
user_choices = []
comp_coices = []



=begin
#CHECKING WINNER OPTIONS

arr = [[1, 2, 3], [4, 5, 6]]

arr.assoc(1) --> [1, 2, 3] CHECKS 1ST IN ARRAY
arr.assoc(4) --> [4, 5, 6]

arr.rassoc(2) => [1, 2, 3] CHECKS SECOND IN ARRAY
arr.rassoc(5) => [4, 5, 6] 
=end


def still_available_numbers?(user_choices, comp_coices, board_array)
  if (user_choices + comp_coices).sort == board_array then return false else return true end
end


#CHECKING USERS INPUT vs PREVIOUS CHOSEN
def checking_user_input(board_hash, user_hand)
  if board_hash[user_hand] == 'empty'
    board_hash[user_hand] = 'X'
  else 
    while board_hash[user_hand] != 'empty'
      puts "choose again"
      user_hand = gets.chomp.to_i
      if board_hash[user_hand] == 'empty'
        board_hash[user_hand] = 'X'
        break
      end
    end
  end
end

# CHECKING COMP INPUTS vs PREVIOUS CHOSEN
def checking_comp_input(board_hash, comp_hand, board_array)
  #unless still_available_numbers?(user_choices, comp_coices, board_array) == false
    if board_hash[comp_hand] == 'empty'
      board_hash[comp_hand] = 'O'
    else
      while board_hash[comp_hand] != 'empty'
        comp_hand = board_array.sample
        if board_hash[comp_hand] == 'empty'
          board_hash[comp_hand] = 'O'
          break
        end
      end
    end
  #end
end

# do until SOLUTION or no 'empty'
until  still_available_numbers?(user_choices, comp_coices, board_array) == false 
  p board_hash
  p "user_choices #{user_choices.uniq!}"
  p "comp_coices #{comp_coices.uniq!}"
  
  user_hand = gets.chomp.to_i
  comp_hand = board_array.sample
  
  checking_user_input(board_hash, user_hand)
  checking_comp_input(board_hash, comp_hand, board_array)

  board_hash.each do |number, value|
    user_choices << number if board_hash[number] =='X'
    comp_coices << number if board_hash[number] == 'O'
  end

  binding.pry

  # if user_choices + comp_choices merge = board array GAME OVER
  # if WINNER then GAME OVER
  
  
  
  
  

end


  puts "mada"






























=begin
  # CONVERTING FROM HASH 'O' AND 'X' TO ARRAY

  example_hash = {1=>"X", 2=>"X", 3=>"X", 4=>"empty", 5=>"empty", 6=>"empty", 7=>"empty", 8=>"empty", 9=>"empty"}
  example_array = []
  
  # PASS 'X' TO ARRAY
  example_hash.each do |number, value|
    example_array << number if example_hash[number] != 'empty'
  end
  p example_array
  
  p WINNING_RESULTS.assoc(example_array[0])
  p WINNING_RESULTS.rassoc(example_array[1])
=end
