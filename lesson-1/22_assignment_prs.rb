# Done before watching the solution
replay = 'y'


# Creates a separation line to make it easier visually
def separation()
  puts "------------------------------------------------"
end


puts "Let's play Paper, Rock, Scissors against the Computer!"
separation()


def prs_game()
    
  # Var declarations
  # result meanings --> 1 = User wins  2 = Computer wins   3 = Tie
  input_user = true
  input_comp = true
  result = true
    
  puts "-> Choose an option: P/R/S"
    
    
  # Save both picks. The user input and the computer Random (between 1 and 3)
  input_user = gets.downcase.chomp
  input_comp = Random.new.rand(1..3)
    
    
  # While loop in case the user picks a wrong choice != PRS
  while input_user != 'p' && input_user != 'r' && input_user != 's' do 
    puts "-> Please choose again. Wrong option."
    input_user = gets.downcase.chomp
  end
    
    
  # Equaling computer inputs to make Ifs easier later
  if input_comp == 1 then input_comp = 'p'
    elsif input_comp == 2 then input_comp = 'r'
  else input_comp = 's' end
    
    
  # Print picks upcased to easy reading
  puts "-> The user choose: #{input_user.upcase}"
  puts "-> And the computer's option is: #{input_comp.upcase}"
    
    
  # Establishing the RESULT value based on both inputs        
  if input_user == input_comp then result = 3
    elsif input_user == 'p' && input_comp == 'r' then result = 1
    elsif input_user == 'p' && input_comp == 's' then result = 2
    elsif input_user == 'r' && input_comp == 'p' then result = 2
    elsif input_user == 'r' && input_comp == 's' then result = 1
    elsif input_user == 's' && input_comp == 'p' then result = 1
    elsif input_user == 's' && input_comp == 'r' then result = 2
  end
    
    
  # Message display based on RESULT
  if result == 1 then puts "-> THE USER WINS!!"       
    elsif result == 2 then puts "-> THE COMPUTER WINS!!"
  else puts "-> Oh! Oh! TIE!!" end
end


# We put the game (prs()) inside a loop to make it replayable
while replay == 'y' || replay == 'Y' do
  prs_game()
  puts "-> Do you want to play again? y/n"
  replay = gets.chomp
  if replay == 'n' then puts "-> Oh..OK. Good Bye boring fella!" end
  separation()
end

