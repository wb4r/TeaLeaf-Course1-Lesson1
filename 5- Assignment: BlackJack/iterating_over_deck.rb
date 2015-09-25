mother_deck = {
  "Suit" => {
      "A" =>  {"value" => 11, "value2" => 1, "quantity" => 1},
      "2" =>  {"value" => 2, "quantity" => 1}
  },
  "Spades" => {
      "3" =>  {"value" => 3, "quantity" => 1},
      "4" =>  {"value" => 4, "quantity" => 1}
  },
  "Hearts" => {
      "5" =>  {"value" => 5, "quantity" => 1},
      "6" =>  {"value" => 6, "quantity" => 1}
  }
}

mother_deck.each_key do |suit|
  p suit
  mother_deck[suit].each do |card, details|
    p card
    p details["quantity"]
    details["quantity"] = 2
  end
end

p mother_deck

five["value"]
# => 5 
five.values_at("quantity")
 #=> [1] 


=begin
suit_sample = mother_deck.keys.sample
# => "Spades"
card_sample = mother_deck[mother_deck.keys.sample].keys.sample
# => "4"
mother_deck[suit_sample][card_sample]["value"]
# => 4
mother_deck[suit_sample][card_sample]["quantity"]
# => 1
=end
