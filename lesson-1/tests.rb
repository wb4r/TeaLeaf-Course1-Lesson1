def is_numeric_string(string)
  string =~ /\A\d+\z/ ? true : false
end

num1 = 0
num2 = 0
operation = 0

loop do
  puts "Please input first integer:"
  num1 = gets.chomp
  puts "Please input second integer:"
  num2 = gets.chomp
  break if is_numeric_string(num1) && is_numeric_string(num2)
  puts "[!] Please input an integer"
end

loop do
  puts "Select: 1 (Add) - 2 (Substract) - 3 (Multiply) - 4 (Divide)"
  operation = gets.chomp
  break if (1..4).include?(operation.to_i)
  puts "[!] Please input a valid number [1 2 3 4]"
end

result =
  case operation
  when "1" then num1.to_i + num2.to_i
  when "2" then num1.to_i - num2.to_i
  when "3" then num1.to_i * num2.to_i
  when "4" then num1.to_f / num2.to_f
  end

puts "Result: #{result}"