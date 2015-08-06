def is_numeric_string(string)
  string =~ /\A\d+\z/ ? true : false
end

# Initialize variables (Scope).
num1 = 0
num2 = 0
operation = 0

# While inputs are different from string formed by digits keeps asking integers.
loop do
  puts "Please input first integer:"
  num1 = gets.chomp
  puts "Please input second integer:"
  num2 = gets.chomp
  if is_numeric_string(num1) && is_numeric_string(num2)
    break
  end
  puts "[!] Please input an integer"
end

# While input is different from 1, 2, 3 or 4 keeps asking for an integer.
loop do
  puts "Select: 1 (Add) - 2 (Substract) - 3 (Multiply) - 4 (Divide)"
  operation = gets.chomp
  if (1..4).include?(operation.to_i)
    break
  end
  puts "[!] Please input a valid number [1 2 3 4]"
end

# Calculate result according to operation.
result =
  case operation
  when "1" then num1.to_i + num2.to_i
  when "2" then num1.to_i - num2.to_i
  when "3" then num1.to_i * num2.to_i
  when "4" then num1.to_f / num2.to_f
  end

# Print operation result.
puts "Result: #{result}"