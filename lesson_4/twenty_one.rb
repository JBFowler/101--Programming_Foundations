# A game similar to blackjack called 21, except the only goal is to stay below 21 while beating the dealers total cards.
require 'pry'

VALUES = %w(1 2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(D C S H)

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_cards(cards, deck)
  cards << deck.pop
end

# effect to make it look like dealer is working
# def deal_cards_effect
#   "Dealing Cards" + "......".each_char { |x| putc x; sleep 0.25; $stdout.flush }
# end

loop do
  prompt("Welcome to 21!")

  sleep(1)

  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  prompt("Dealer is dealing cards")

  2.times do
    deal_cards(player_cards, deck)
    deal_cards(dealer_cards, deck)
  end
  
  sleep(1)

end