require 'pry'
# Done without looking at the video solution
user_hand = ""
comp_hand = ""
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#bh for board_hash. Shorten the name when building the physical layout
bh = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = []
comp_choices = []
winner = nil
combinations_comp_to_win = []
empty_positions_array = []


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


def winner_alg(winner, user_choices, comp_choices)
  
  
  WINNING_RESULTS.each do |key, solutions|
    if WINNING_RESULTS[key] - user_choices == [] 
      return "User" 
      #puts "The User is the winner!"
    elsif WINNING_RESULTS[key] - comp_choices == [] 
      return "Computer" 
      #puts "The Computer is the winner!"
    else return nil end
  end
  
  
end


# Checking user inputs vs numbers previously used PC+User
def user_input(bh, user_hand, user_choices)
  user_hand = gets.chomp.to_i
  while empty_positions(bh).index(user_hand) == nil
    puts "choose again"; user_hand = gets.chomp.to_i
  end
  bh[user_hand] = 'X'
  user_choices << user_hand
end 

=begin
  if bh[user_hand] == ' ' then bh[user_hand] = 'X'
  else while bh[user_hand] != ' '
      puts "choose again"; user_hand = gets.chomp.to_i
      if bh[user_hand] == ' ' then bh[user_hand] = 'X'; break end
    end
  end
end
=end


# Checking computer inputs vs numbers previously used PC+User
#def computer_input(bh, comp_hand, board_array, comp_choices, combinations_comp_to_win)
def computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win)
  
  
  comp_hand = empty_positions(bh).sample
  bh[comp_hand] = 'O'
  comp_choices << comp_hand
  #comp_hand = 'O'
  
  
  
  #if comp_choices.empty? then comp_hand = empty_positions(bh).sample
  #else
  #  comp_hand = combinations_comp_to_win.sample
  #end
  #comp_hand = 'O'
  
  
  
  
=begin  
  if comp_choices == [] then comp_hand = board_array.sample
    if bh[comp_hand] == ' ' then bh[comp_hand] = 'O'
    else 
      while bh[comp_hand] != ' '
      comp_hand = board_array.sample
      if bh[comp_hand] == ' ' then bh[comp_hand] = 'O'; break end  
      end
    end
  else 
    combinations_comp_to_win.sample
    if combinations_comp_to_win.sample.class == Fixnum
      comp_hand = combinations_comp_to_win.sample
    else 
      comp_hand = combinations_comp_to_win.sample.sample
    end
    if bh[comp_hand] == ' ' then bh[comp_hand] = 'O'
    else binding.pry end
  end
=end

end

begin 

  
  empty_positions_array = empty_positions(bh)
  playing_board(bh, user_choices, comp_choices, combinations_comp_to_win)
  user_input(bh, user_hand, user_choices)
  computer_input(bh, comp_hand, comp_choices, combinations_comp_to_win)
  winner_alg(winner, user_choices, comp_choices)
  
  #binding.pry
##################################### CODE ADDED NEW FEATURES
  
def move_to_win(comp_choices, user_choices, combinations_comp_to_win)
    WINNING_RESULTS.each do |key, solutions|
      comp_choices.each_index do |x|
        if WINNING_RESULTS[key].include?(comp_choices[x])
          combinations_comp_to_win << WINNING_RESULTS[key]
        end
      end
    end
  
    combinations_comp_to_win.each_index do |x|
      comp_choices.each_index do |a|
        if combinations_comp_to_win[x].include?(comp_choices[a])
          combinations_comp_to_win[x] = combinations_comp_to_win[x] - [comp_choices[a]]
        end
      end
    end
  
    combinations_comp_to_win.uniq!
  
    user_choices.each_index do |b|
      combinations_comp_to_win.each_index do |b|
        if combinations_comp_to_win[b].include?(user_choices[b])
          combinations_comp_to_win.delete_at(b)
        end
      end
    end
  
    2.times do
    user_choices.each_index do |b|
      combinations_comp_to_win.each_index do |x|
        if combinations_comp_to_win[x].include?(user_choices[b])
          combinations_comp_to_win.delete_at(x)
        end
      end
    end
  end
end
  
##################################### END OF NEW FEATURES CODE
  
=begin
  # SOLVED WITH empty_positions METHOD
  # 'if' avoids user entering if there are no more numbers available to choose
  if (user_choices + comp_choices).sort != board_array
    user_input(bh, user_hand)
    
    # Adds 'X' to the chosen values array
    bh.each {|number, value| user_choices << number if bh[number] =='X'}
    user_choices.sort!.uniq!
  end
  
  # 'if' avoids comp entering if there are no more numbers available to choose
  if (user_choices + comp_choices).sort != board_array
    
    move_to_win(comp_choices, user_choices, combinations_comp_to_win) ###### NF!!!!!!!!!!!!!
    
    computer_input(bh, comp_hand, board_array, comp_choices, combinations_comp_to_win)
    
    # Adds 'O' to the chosen values array
    bh.each {|number, value| comp_choices << number if bh[number] == 'O'}
    comp_choices.sort!.uniq!
  end
=end
  # Each loop this checks for a winner --> CREATE METHOD ?¿
  # METHOD CREATED
=begin
  WINNING_RESULTS.each do |key, solutions|
    if WINNING_RESULTS[key] - user_choices == [] 
      winner = "user" 
      puts "#{winner} is the winner!"
    end
    if WINNING_RESULTS[key] - comp_choices == [] 
      winner = "computer" 
      puts "#{winner} is the winner!"
    end
  end
=end

end until empty_positions(bh).empty? || winner_alg(winner, user_choices, comp_choices) != nil

playing_board(bh, user_choices, comp_choices, combinations_comp_to_win)
puts "GAME OVER!"



# PENDING: 

# indent
# clear code out
# START ALEATORIO USER vs PC
# IA de mierda..




















