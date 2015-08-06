# MODIFIED after the video solution
replay = 'y'
CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}


# Creates a separation line to make it easier visually
def separation()
  puts "------------------------------------------------"
end


puts "Let's play Paper, Rock, Scissors against the Computer!"
separation()


def prs()
    
  # Var declarations
  # result meanings --> 1 = User wins  2 = Computer wins   3 = Tie
  input_user, input_comp = true
    
  puts "-> Choose an option: P/R/S"
    
    
  # Save both picks. The user input and the computer Random (between 1 and 3)
  input_user = gets.downcase.chomp
  input_comp = CHOICES.keys.sample
    
    
  # While loop in case the user picks a wrong choice != PRS
  while CHOICES.keys.include?(input_user) == false do 
      puts "-> Please choose again. Wrong option."
      input_user = gets.downcase.chomp
  end
    
    
  # Print picks upcased to easy reading
  puts "-> The user choose: #{input_user.upcase}"
  puts "-> And the computer's option is: #{input_comp.upcase}"
    
    
  # Establishing the RESULT value based on both inputs        
  if input_user == input_comp then puts "---> Oh! Oh! TIE!!"
    elsif (input_user == 'p' && input_comp == 'r') || (input_user == 'r' && input_comp == 's') || (input_user == 's' && input_comp == 'p')
      then puts "---> THE USER WINS!!"
  else puts "---> THE COMPUTER WINS!!" end
  
  
  CHOICES.each do |k, v|
    if input_user == k then input_user = CHOICES[k][v] end
    if input_comp == k then input_comp = CHOICES[k][v] end
  end
  puts "---> It was #{input_user} vs. #{input_comp}"
    
end


# We put the game (prs()) inside a loop to make it replayable
while replay == 'y' || replay == 'Y' do
  prs()
  puts "-> Do you want to play again? y/n"
  replay = gets.chomp
  if replay == 'n' then puts "-> Oh..OK. Good Bye boring fella!" end
    separation()
end

