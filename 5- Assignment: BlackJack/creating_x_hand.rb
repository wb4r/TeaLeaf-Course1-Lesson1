require 'pry'
ingame_deck = {"Spades"=>{"A"=>{"value"=>11, "value2"=>1, "quantity"=>2}, "2"=>{"value"=>2, "quantity"=>2}, "3"=>{"value"=>3, "quantity"=>2}, "4"=>{"value"=>4, "quantity"=>2}, "5"=>{"value"=>5, "quantity"=>2}, "6"=>{"value"=>6, "quantity"=>2}, "7"=>{"value"=>7, "quantity"=>2}, "8"=>{"value"=>8, "quantity"=>2}, "9"=>{"value"=>9, "quantity"=>2}, "10"=>{"value"=>10, "quantity"=>2}, "Jack"=>{"value"=>10, "quantity"=>2}, "Queen"=>{"value"=>10, "quantity"=>2}, "King"=>{"value"=>10, "quantity"=>2}}, "Hearts"=>{"A"=>{"value"=>11, "value2"=>1, "quantity"=>2}, "2"=>{"value"=>2, "quantity"=>2}, "3"=>{"value"=>3, "quantity"=>2}, "4"=>{"value"=>4, "quantity"=>2}, "5"=>{"value"=>5, "quantity"=>2}, "6"=>{"value"=>6, "quantity"=>2}, "7"=>{"value"=>7, "quantity"=>2}, "8"=>{"value"=>8, "quantity"=>2}, "9"=>{"value"=>9, "quantity"=>2}, "10"=>{"value"=>10, "quantity"=>2}, "Jack"=>{"value"=>10, "quantity"=>2}, "Queen"=>{"value"=>10, "quantity"=>2}, "King"=>{"value"=>10, "quantity"=>2}}, "Diamonds"=>{"A"=>{"value"=>11, "value2"=>1, "quantity"=>2}, "2"=>{"value"=>2, "quantity"=>2}, "3"=>{"value"=>3, "quantity"=>2}, "4"=>{"value"=>4, "quantity"=>2}, "5"=>{"value"=>5, "quantity"=>2}, "6"=>{"value"=>6, "quantity"=>2}, "7"=>{"value"=>7, "quantity"=>2}, "8"=>{"value"=>8, "quantity"=>2}, "9"=>{"value"=>9, "quantity"=>2}, "10"=>{"value"=>10, "quantity"=>2}, "Jack"=>{"value"=>10, "quantity"=>2}, "Queen"=>{"value"=>10, "quantity"=>2}, "King"=>{"value"=>10, "quantity"=>2}}, "Clubs"=>{"A"=>{"value"=>11, "value2"=>1, "quantity"=>2}, "2"=>{"value"=>2, "quantity"=>2}, "3"=>{"value"=>3, "quantity"=>2}, "4"=>{"value"=>4, "quantity"=>2}, "5"=>{"value"=>5, "quantity"=>2}, "6"=>{"value"=>6, "quantity"=>2}, "7"=>{"value"=>7, "quantity"=>2}, "8"=>{"value"=>8, "quantity"=>2}, "9"=>{"value"=>9, "quantity"=>2}, "10"=>{"value"=>10, "quantity"=>2}, "Jack"=>{"value"=>10, "quantity"=>2}, "Queen"=>{"value"=>10, "quantity"=>2}, "King"=>{"value"=>10, "quantity"=>2}}}


def update_cards_indeck(ingame_deck)
  ingame_deck.each_key do |suit|
    ingame_deck[suit].delete_if do |card, details|
      details["quantity"] == 0
    end
  end
end

#p ingame_deck

#p ingame_deck

#100.times do 
  update_cards_indeck(ingame_deck)
  dealer_hand = []
  suit_sample = ingame_deck.keys.sample # "Spades"
  card_sample = ingame_deck[suit_sample].keys.sample # "5"
  dealer_hand << ingame_deck[suit_sample][card_sample]["value"]
  ingame_deck[suit_sample][card_sample]["quantity"] -= 1
  update_cards_indeck(ingame_deck)
#end

#update_cards_indeck(ingame_deck)
p "##################################"
p ingame_deck



=begin
suit_sample = ingame_deck.keys.sample
# => "Spades"
card_sample = ingame_deck[ingame_deck.keys.sample].keys.sample
# => "4"
ingame_deck[suit_sample][card_sample]["value"]
# => 4
ingame_deck[suit_sample][card_sample]["quantity"]
# => 1
=end

