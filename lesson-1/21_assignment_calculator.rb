# Variable declarations
input_number1, input_number2, calculation, total = 0

# Here comes the text and the numbers inputs, as well as the calculation option
puts "This is a Calculator. You'll be asked to provide 2 numbers and what to do with them."
puts "Provide the first number: "
input_number1 = gets.chomp
puts "Provide the second number: "
input_number2 = gets.chomp
puts "Choose the number referencing the calculation you wish to do: "
puts "1--> +    2--> -    3--> *    4-->/"
calculation = gets.chomp

# Converting to Float if a '.' is detected in the input value
if input_number1.include?(".") || input_number2.include?(".")
    input_number1 = input_number1.to_f
    input_number2 = input_number2.to_f
else
    input_number1 = input_number1.to_i
    input_number2 = input_number2.to_i
end

# Here the result will be calculated based on the calculation option choosen
case calculation
when '1'
    total = input_number1 + input_number2
when '2'
    total = input_number1 - input_number2
when '3'
    total = input_number1 * input_number2
when '4'
    total = input_number1.to_f / input_number2.to_f
else
    puts "Please, choose a correct option and try again."
end

# Prints the result
puts "The result is: #{total}"



# DOUBTS:
# => If input1 = 10.5, input2 = 5.5 and calculation = 4 it gives 1.90909
# If it has converted it to_i hows possible that it still can convert it to_f?

# => If input1 = 6.3, input2 = 6 and calculation = 2 the result is 0.2999999 instead
# of 0.3