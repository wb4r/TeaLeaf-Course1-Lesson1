bh = {1=>"O", 2=>"O", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
comp_choices = [2, 3]
next_comp_move = [3, 4]

p next_comp_move
bh.each do |index, game|
  if game == 'X' 
    next_comp_move.delete(index)
  end
end
p next_comp_move
puts "########################################"
puts "correct next moves are 123 - 159 - 258"

def meth(bh, next_comp_move)
  WINNING_RESULTS.each do |line, array|
    if bh[array[0]] == 'O' and bh[array[1]] == 'O' and bh[array[2]] != 'X'
      next_comp_move << array[2]
      puts "line: #{line} array: #{array} next_comp_move: #{array[2]}"
      
    elsif bh[array[1]] == 'O' and bh[array[2]] == 'O' and bh[array[0]] != 'X'
      next_comp_move << array[0]
      puts "line: #{line} array: #{array} next_comp_move: #{array[0]}"
      
    elsif bh[array[0]] == 'O' and bh[array[2]] == 'O' and bh[array[1]] != 'X'
      next_comp_move << array[1]
      puts "line: #{line} array: #{array} next_comp_move: #{array[1]}"
    end
  end
end

meth(bh, next_comp_move)
p next_comp_move

