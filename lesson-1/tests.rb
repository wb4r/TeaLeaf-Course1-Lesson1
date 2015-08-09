require 'pry'
bh = {1=>"X", 2=>" ", 3=>"X", 4=>"O", 5=>"O", 6=>" ", 7=>"O", 8=>"O", 9=>" "}
comp_choices = [1, 3]
user_choices = [4, 5, 7, 8]
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
numbers_left_to_win = []
#tunnel = []
combinations_comp_to_win = []
tunnel = []
    
  
    
WINNING_RESULTS.each do |key, solutions|
  comp_choices.each_index do |x|
    if WINNING_RESULTS[key].include?(comp_choices[x])
      combinations_comp_to_win << WINNING_RESULTS[key]
    end
  end
end
  
p "combinations_comp_to_win: #{combinations_comp_to_win}"  
  
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
    #puts "#{combinations_comp_to_win[b]} vs #{user_choices[b]}"
    if combinations_comp_to_win[b].include?(user_choices[b])
      combinations_comp_to_win.delete_at(b)
    end
  end
end

user_choices.each_index do |b|
  combinations_comp_to_win.each_index do |x|
    #puts "#{combinations_comp_to_win[b]} vs #{user_choices[b]}"
    if combinations_comp_to_win[x].include?(user_choices[b])
      combinations_comp_to_win.delete_at(x)
    end
  end
end

p "combinations_comp_to_win: #{combinations_comp_to_win}"
p comp_choices
p user_choices
p "----------------------------------------"

#combinations_comp_to_win.flatten!
p "combinations_comp_to_win: #{combinations_comp_to_win}"
p "MIN: #{combinations_comp_to_win.min}"

combinations_comp_to_win.min_by do |x|
  
  #puts "#{x} --> #{x.length}"
  #if x.length == 1 then tunnel << x 
  #  elsif x.length == 2 then tunnel << x
  #else tunnel << x 
  #end
  puts x.length
end


p tunnel.index.min

p














  
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
    