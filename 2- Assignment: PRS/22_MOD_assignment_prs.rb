replay = true
input_user = true
input_comp = true
CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

# Creates a separation line to make it easier visually
def separation()
  puts "------------------------------------------------"
end

# Method to play or not again. Attached at the end of LOOP
def play_again?
  replay = gets.chomp
  replay == 'y'
end

puts "Let's play Paper, Rock, Scissors against the Computer!"
separation()

# MAIN GAME
while replay
  puts "-> Choose an option: P/R/S"
    
  # Save both picks. The user input and the computer Random (between 1 and 3)
  input_user = gets.downcase.chomp
  input_comp = CHOICES.keys.sample
    
  # While loop if USER picks a WRONG choice != PRS
  while CHOICES.keys.include?(input_user) == false do 
    puts "-> Please choose again. Wrong option."
    input_user = gets.downcase.chomp
  end
  
  # PRINT picks upcased to easy reading
  puts "-> The user choose: #{input_user.upcase}"
  puts "-> And the computer's option is: #{input_comp.upcase}"
    
  # Establishing the RESULT value based on both inputs        
  if input_user == input_comp then puts "---> Oh! Oh! TIE!!"
    elsif (input_user == 'p' && input_comp == 'r') || (input_user == 'r' && input_comp == 's') || (input_user == 's' && input_comp == 'p')
      then puts "---> THE USER WINS!!"
  else puts "---> THE COMPUTER WINS!!" end
  
  # This is extra. Could go out actually. I was practicing "hash.each do |key, value|"
  CHOICES.each do |k, v|
    if input_user == k then input_user = CHOICES[k][v] end
    if input_comp == k then input_comp = CHOICES[k][v] end
  end
  
  puts "---> It was #{input_user} vs. #{input_comp}"
  puts "-> Do you want to play again? y/n"
  
  replay = play_again?
  separation
end

