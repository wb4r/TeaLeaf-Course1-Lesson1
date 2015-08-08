require 'pry'

variable = 'O'

if variable == 'empty'
    variable = 'X'
else while variable != 'empty'
    puts "choose again"; user_hand = gets.chomp.to_i
    if variable == 'empty' then variable = 'X'; break end
  end
end

puts variable