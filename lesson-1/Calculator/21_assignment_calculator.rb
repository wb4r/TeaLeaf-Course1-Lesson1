# Variable declarations
input_number1 = 0
input_number2 = 0
calculation = 0
total = 0

# Here comes the text and the numbers inputs, as well as the calculation option
puts "This is a Calculator. You'll be asked to provide 2 numbers and what to do with them."
puts "Provide the first number: "
input_number1 = gets.chomp
puts "Provide the second number: "
input_number2 = gets.chomp

# Options to calculate. Wont break if != (1..4)
loop do 
  puts "Choose the number referencing the calculation you wish to do: "
  puts "1--> +    2--> -    3--> *    4-->/"
  calculation = gets.chomp
  break if (1..4).include?(calculation.to_i)
  puts "Please, choose a correct option and try again."
end

# Here the result will be calculated based on the calculation option choosen
case calculation
when '1'
  total = input_number1.to_i + input_number2.to_i
when '2'
  total = input_number1.to_i - input_number2.to_i
when '3'
  total = input_number1.to_i * input_number2.to_i
when '4'
  total = input_number1.to_f / input_number2.to_f
end

# Prints the result
puts "The result is: #{total}"

