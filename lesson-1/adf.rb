require 'pry'
hash_one = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
hash_two = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
array_one = [1,2,3]
array_two = [4,5,6]




hash_two.each_pair do |key, solutions|
    
    p hash_two[key]
    if hash_two[key] - array_one == [] 
      p "User" 
    elsif hash_two[key] - array_two == [] 
      p "Computer" 
    else p "nothing" end
end

