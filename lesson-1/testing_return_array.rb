require 'pry'
mother_array = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
array_one = [1,2,3]
array_two = [4,5,6]
winner = nil

puts "ARRAY"
################# First testing, nothing gets activated
if winner == true
  puts true 
elsif winner == false 
  puts false 
elsif winner == nil
  puts nil
else
  puts "Everything else failed in the first IF statement"
end


#################
# Method for testing return with Arrays vs Hashes. Problem came from TTT_Game
def testing(mother_array, array_one, array_two, winner)
  mother_array.each_index do |index, array|
    if mother_array[index] - array_one == [] 
      #p "USER #{mother_array[index]}" IF unquoted last winner == false
      return 'User' #IF unquoted last winner == 'User'
    elsif mother_array[index] - array_two == [] 
      return 'Computer' #IF unquoted last winner == 'Computer', 
                        #or the first IF reached
    end
  end
end

winner = testing(mother_array, array_one, array_two, winner)
p winner


#################
if winner == true
  puts true 
else 
  puts "winner == true is: FALSE"
end
# Why is this statement still not being true?


#################
if winner != true
  puts "winner != true is: TRUE" 
else 
  puts false
end


################
if winner == false
  puts true
else 
  puts "winner == false is: FALSE" 
end


################
if winner != false
  puts "winner != false is: TRUE"
else 
  puts false 
end

# so I understand that winner is NOT TRUE and is NOT NIL as when declared
# but it is FALSE, even tho it "has" the "User" in it ?


################
if winner == nil
  puts nil 
else 
  puts "winner == nil is: FALSE"
end
# but again, it doesnt fall into == nil statement. So, what is it?


################
if winner != nil
  puts "winner != nil is: TRUE" 
else 
  puts false
end


################
if winner == 'User'
  puts "winner == 'User' is: TRUE" 
else 
  puts false
end
# I am missing something. Winner is not == to anything but 'User', or 'Computer'
# But anything is true except FALSE and NIL, right?
