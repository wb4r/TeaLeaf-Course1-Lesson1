ingame_deck = {
  "Spades" => {
      "A" =>  {"value" => 11, "value2" => 1, "quantity" => 2},
      "2" =>  {"value" => 2, "quantity" => 2}
  },
  "Hearts" => {
      "3" =>  {"value" => 3, "quantity" => 2},
      "4" =>  {"value" => 4, "quantity" => 2}
  },
  "Diamonds" => {
      "5" =>  {"value" => 5, "quantity" => 2},
      "6" =>  {"value" => 6, "quantity" => 2}
  },
  "Clubs" => {
      "7" =>  {"value" => 7, "quantity" => 2},
      "8" =>  {"value" => 8, "quantity" => 0}
  }
}
p ingame_deck
def update_cards_indeck(ingame_deck)
  ingame_deck.each_key do |suit|
    ingame_deck[suit].delete_if do |card, details|
      details["quantity"] == 0
    end
  end
end

update_cards_indeck(ingame_deck)


puts "-----------------------------------"
p ingame_deck
