require 'pry'


# mother_deck can be used if > 1 player => 1 deck more per player
def create_mother_deck(mother_deck)
  mother_deck = {
    "Suit" => {
      "A" =>  {"value" => 11, "value2" => 1, "quantity" => 1},
      "2" =>  {"value" => 2, "quantity" => 1},
      "3" =>  {"value" => 3, "quantity" => 1},
      "4" =>  {"value" => 4, "quantity" => 1},
      "5" =>  {"value" => 5, "quantity" => 1},
      "6" =>  {"value" => 6, "quantity" => 1},
      "7" =>  {"value" => 7, "quantity" => 1},
      "8" =>  {"value" => 8, "quantity" => 1},
      "9" =>  {"value" => 9, "quantity" => 1},
      "10" =>  {"value" => 10, "quantity" => 1},
      "Jack" =>  {"value" => 10, "quantity" => 1},
      "Queen" =>  {"value" => 10, "quantity" => 1},
      "King" =>  {"value" => 10, "quantity" => 1},
    }
  }
  mother_deck["Spades"] = mother_deck["Suit"]
  mother_deck["Hearts"] = mother_deck["Suit"]
  mother_deck["Diamonds"] = mother_deck["Suit"]
  mother_deck["Clubs"] = mother_deck["Suit"]
  mother_deck.delete("Suit")
  return mother_deck
end


def create_2_decks_deck(mother_deck)
  mother_deck.each_key do |suit|
    mother_deck[suit].each do |card, details|
      details["quantity"] = 2
    end
  end
  return mother_deck
end


# If quantity == 0 the card will be deleted from deck
def update_cards_indeck(ingame_deck)
  ingame_deck.each_key do |suit|
    ingame_deck[suit].delete_if do |card, details|
      details["quantity"] == 0
    end
  end
end

# Dealer and player hand - creates & updates

def manage_dealer_hand(dealer_hand, ingame_deck)
  update_cards_indeck(ingame_deck)
  suit_sample = ingame_deck.keys.sample # "Spades"
  card_sample = ingame_deck[suit_sample].keys.sample # "5"
  dealer_hand << ingame_deck[suit_sample][card_sample]["value"]
  ingame_deck[suit_sample][card_sample]["quantity"] -= 1
  update_cards_indeck(ingame_deck)
end


def manage_player_hand(player_hand, ingame_deck)
  update_cards_indeck(ingame_deck)
  suit_sample = ingame_deck.keys.sample # "Spades"
  card_sample = ingame_deck[suit_sample].keys.sample # "5"
  player_hand << ingame_deck[suit_sample][card_sample]["value"]
  ingame_deck[suit_sample][card_sample]["quantity"] -= 1
  update_cards_indeck(ingame_deck)
end


# Rules for Player
def player_play(dealer_hand, player_hand, hit_or_stay, ingame_deck)
  begin
    display_ingame(dealer_hand, player_hand)
    puts "Do you want another card? (hit/stay)"
    hit_or_stay = gets.chomp
    
    if hit_or_stay == "hit" 
      manage_player_hand(player_hand, ingame_deck) 
    end
      
    while player_hand.inject(:+) > 21 && player_hand.max == 11
      player_hand.delete(11) 
      player_hand.replace(player_hand << 1)
    end
  end until hit_or_stay == "stay" || player_hand.inject(:+) >= 21
  hit_or_stay
end


# Rules for Dealer
def dealer_play(dealer_hand, player_hand, ingame_deck)
  while  dealer_hand.inject(:+) < 17
    manage_dealer_hand(dealer_hand, ingame_deck)
    display_ingame_uncovered(dealer_hand, player_hand)
    if dealer_hand.inject(:+) > 21 && dealer_hand.max == 11
      dealer_hand.delete(11) 
      dealer_hand.replace(dealer_hand << 1)
    end
  end
end


# Methods for displaying Board and results
def clear_screen
  puts "Enter to continue."
  if gets.chomp 
    system 'clear'
    system('cls') 
    puts " => Dealing cards"
    4.times do
      print "....."
      sleep 0.3
    end
    system 'clear'
    system('cls')
  end
end

def blank_line
  puts ""
end

def display_ingame(dealer_hand, player_hand)
  clear_screen
  puts "      BOARD       "
  puts "##################   \u2660    \u2663    \u2665    \u2666   "
  puts "# Dealer Cards: #{dealer_hand[0]}, X"
  puts "# Total Dealer: --"
  puts "# Player Cards: #{player_hand}"
  puts "# Total Player: #{player_hand.inject(:+)}"
  puts "####################################"
end

def display_ingame_uncovered(dealer_hand, player_hand)
  clear_screen
  puts "      BOARD       "
  puts "##################   \u2660    \u2663    \u2665    \u2666   "
  puts "# Dealer Cards: #{dealer_hand}"
  puts "# Total Dealer: #{dealer_hand.inject(:+)}"
  puts "# Player Cards: #{player_hand}"
  puts "# Total Player: #{player_hand.inject(:+)}"
  puts "####################################"
end


# Final resolution of each game
def resolution(player_hand, dealer_hand)
  if player_hand.inject(:+) > 21
    puts "Player busted!!"
  else
    if dealer_hand.inject(:+) > 21 || player_hand.inject(:+) > dealer_hand.inject(:+)
      puts "Player won!!"
    elsif player_hand.inject(:+) == dealer_hand.inject(:+)
      puts "Same score.. Dealer wins!!"
    elsif player_hand.inject(:+) < dealer_hand.inject(:+)
      puts "Dealer wins!!"
    end
  end
end


# Game starts here
######################################################

replay = 'yes'.downcase
system 'clear'
system('cls')
puts "###################### \u2660 \u2663 \u2665 \u2666 ########################"
puts "#     You have to reach 21 or the closest to 21.      #"
puts "#   If you get more than 21 you lose automatically    #"
puts "#   Once you have your 2 first cards you can choose   #"
puts "#                  to Stay or to Hit                  #"
puts "#       In order to get a new card, write 'hit'.      #"
puts "#          If you want to stay and see the            #"
puts "#           the Dealers card, write 'stay'.           #"
puts "#             Ace card is worth 1 or 11               #"
puts "###################### \u2660 \u2663 \u2665 \u2666 ########################"
blank_line
puts "Introduce your user name: "
player = gets.chomp
system 'clear'
system('cls')

begin
  clear_screen
  
  # Variables set to 0: beginning
  mother_deck = create_mother_deck(mother_deck)
  ingame_deck = create_2_decks_deck(mother_deck)
  dealer_hand = []
  player_hand = []
  hit_or_stay = true
  
  # First hand for both
  2.times {manage_player_hand(player_hand, ingame_deck)}
  2.times {manage_dealer_hand(dealer_hand, ingame_deck)}
  
  blank_line
  puts "\u2660 \u2663 \u2665 \u2666 Wellcome to Edinburgh CASINO \u2660 \u2663 \u2665 \u2666"
  puts "            Are you ready #{player.capitalize}?"
  blank_line
  puts "The Dealer gave the players their first hand =>"
  
  hit_or_stay = player_play(dealer_hand, player_hand, hit_or_stay, ingame_deck)
  if hit_or_stay == 'stay'
    blank_line
    puts "=> Very well. Now's the Dealer turn"
    puts "=> Dealer uncovers his second card."
    puts "=> Dealer will play at least until 17"
    dealer_play(dealer_hand, player_hand, ingame_deck)
  end
  
  # Uncovers Dealer card and Show results
  display_ingame_uncovered(dealer_hand, player_hand)
  puts "FINAL SCORE!!!"
  resolution(player_hand, dealer_hand)
  
  # Replay
  blank_line
  puts "              \u2660    \u2663    \u2665    \u2666   "
  puts "* * * Do you want to play again? (yes/no) * * *"
  replay = gets.downcase.chomp
  
end until replay == 'no'

system 'clear'
system('cls')
blank_line
puts "              BlackJack Game is over!"
puts "\u2660 \u2663 \u2665 \u2666 Edinburgh CASINO wishes you a good day! \u2660 \u2663 \u2665 \u2666"
blank_line