require 'pry'
# Done without looking at the video solution
user_hand = ""
comp_hand = ""
#comp_hand_source = [1]
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board_hash = {1=>"empty", 2=>"empty", 3=>"empty", 4=>"empty", 5=>"empty", 6=>"empty", 7=>"empty", 8=>"empty", 9=>"empty"}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = []
comp_choices = []
winner = false
combinations_comp_to_win = []


# Checking user inputs vs numbers previously used PC+User
def checking_user_input(board_hash, user_hand)
  if board_hash[user_hand] == 'empty' then board_hash[user_hand] = 'X'
  else while board_hash[user_hand] != 'empty'
      puts "choose again"; user_hand = gets.chomp.to_i
      if board_hash[user_hand] == 'empty' then board_hash[user_hand] = 'X'; break end
    end
  end
end

# Checking computer inputs vs numbers previously used PC+User
def checking_comp_input(board_hash, comp_hand, board_array, comp_choices, combinations_comp_to_win)


  if comp_choices == [] then comp_hand = board_array.sample
    if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O'
    else 
      while board_hash[comp_hand] != 'empty'
      comp_hand = board_array.sample
      if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O'; break end  
      end
    end
    #binding.pry THE 2nd TIME DOES NOT ENTER SO IT READS OK THE 'ELSE'
  else 
    
    if combinations_comp_to_win.sample.class == Fixnum
      comp_hand = combinations_comp_to_win.sample
    else 
      comp_hand = combinations_comp_to_win.sample.sample
    end
    if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O'
    else binding.pry end
  end
  
=begin
    begin
      comp_hand = combinations_comp_to_win.sample
    rescue
      comp_hand = combinations_comp_to_win.sample.sample
    end
    if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O'
    else binding.pry end
=end
    
=begin
    if combinations_comp_to_win.sample.sample?nil == false
      comp_hand = combinations_comp_to_win.sample.sample
    else comp_hand = combinations_comp_to_win.sample
    end
  end
=end
  
=begin
  if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O' # COMPUTER IA HERE #########################
  else while board_hash[comp_hand] != 'empty'
      comp_hand = board_array.sample
      if board_hash[comp_hand] == 'empty' then board_hash[comp_hand] = 'O'; break end  # COMPUTER IA HERE ####################
    end
  end
=end
  p "combinations_comp_to_win: #{combinations_comp_to_win}"
end

# Loop prevents the game from stoping before condition
# Condition is ALL NUMBERS used
# OR
# Condition is there_is_a_winner
until  (user_choices + comp_choices).sort == board_array || winner != false
  p board_hash
  p "user_choices #{user_choices}"
  p "comp_choices #{comp_choices}"
  
  user_hand = gets.chomp.to_i
  
  
  
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
  
  # 'if' avoids user entering if there are no more numbers available to choose
  if (user_choices + comp_choices).sort != board_array
    checking_user_input(board_hash, user_hand)
    
    # Adds 'X' to the chosen values array
    board_hash.each {|number, value| user_choices << number if board_hash[number] =='X'}
    user_choices.sort!.uniq!
  end
  
  # 'if' avoids comp entering if there are no more numbers available to choose
  if (user_choices + comp_choices).sort != board_array
    
    move_to_win(comp_choices, user_choices, combinations_comp_to_win) ###### NF!!!!!!!!!!!!!
    
    checking_comp_input(board_hash, comp_hand, board_array, comp_choices, combinations_comp_to_win)
    
    # Adds 'O' to the chosen values array
    board_hash.each {|number, value| comp_choices << number if board_hash[number] == 'O'}
    comp_choices.sort!.uniq!
  end
  
  # Each loop this checks for a winner --> CREATE METHOD ?¿
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
end


puts "GAME OVER 110"
p "user_choices #{user_choices}"
p "comp_choices #{comp_choices}"


# PENDING: 

# Physical LAYOUT
# START ALEATORIO USER vs PC
































=begin




#             NOT IN USE
def jump_when_winner(user_choices, comp_choices, winner)
  WINNING_RESULTS.each do |key, solutions|
    if WINNING_RESULTS[key] - user_choices == [] then winner = "user" end
    if WINNING_RESULTS[key] - comp_choices == [] then winner = "computer" end
  end
end

# =>          NOT IN USE
def still_available_numbers?(user_choices, comp_choices, board_array)
  if (user_choices + comp_choices).sort!.uniq! == board_array then return false else return true end
  binding.pry
end

=end