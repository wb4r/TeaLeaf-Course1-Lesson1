#Before watching the Lesson Lecture (part 1 & 2) I ventured to try this on my own
# This is not the assignment on Lesson 1.21

input_number_1 = 0
input_number_2 = 0
result = 0
input_calc = true

puts 'Give me the first number'
input_number_1 = gets.chomp.to_i

puts 'Give me the second number'
input_number_2 = gets.chomp.to_i

puts 'Choose a Calculaor option: '
puts '1--> + 2--> - 3--> * 4--> / 5-->%'
input_calc = gets.chomp

if input_calc == '1' then result = input_number_1 + input_number_2
elsif input_calc == '2' then result = input_number_1 - input_number_2
elsif input_calc == '3' then result = input_number_1 * input_number_2
elsif input_calc == '4' then result = input_number_1.to_f / input_number_2.to_f
elsif input_calc == '5' then result = input_number_1 % input_number_2 end
    
    

puts "The result is: #{result}"