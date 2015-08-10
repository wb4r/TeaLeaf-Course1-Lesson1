require 'pry'
bh = {1=>"X", 2=>"X", 3=>"X", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
user_choices = [7,8,9]
comp_choices = [3,6,9]




WINNING_RESULTS.each_pair do |key, solutions|
    binding.pry
    p WINNING_RESULTS[key]
    if WINNING_RESULTS[key] - user_choices == [] 
      p "User" 
    elsif WINNING_RESULTS[key] - comp_choices == [] 
      p "Computer" 
    else p "nothing" end
end













=begin
def check_for_winner(line, squares)
  if line.find {|l| l.all? {|k| squares[k] == X} }
    puts "player WINS!!!"
    true
  elsif line.find {|l| l.all? {|k| squares[k] == O} }
    puts "computer wins :("
    true
  end
end


   bh.find {|k, v| bh[k] == 'X'}
   WINNING_RESULTS.find do |x|
      x.all?
      
   end  
     
     bh.all? do |k|
        #if bh[k] == 'X' then p bh[k] end
     end

WINNING_RESULTS.each_pair do |key, solutions|
   
   #p WINNING_RESULTS[key]
   p key
   p solutions
   solutions.each do |ind|
      p ind
      ind.all? do |line|
      
         if ind == 'X' then p bh[key] end
      
      end
      
   end
   
end
     
=end  
  
     
=begin
  WINNING_RESULTS.each_pair do |key, solutions|
    #binding.pry
    if WINNING_RESULTS[key] - user_choices == [] 
      return "User" 
    elsif WINNING_RESULTS[key] - comp_choices == [] 
      return "Computer" 
    else return nil end
    end
end
=end