# A game similar to blackjack called 21, except the only goal is to stay below 21 while beating the dealers total cards.
require 'pry'

VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(D C S H)
PLAYER = 'player'
DEALER = 'dealer'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_cards(cards, deck)
  cards << deck.pop
end

def calculate_total(cards)
  values = cards.map { |card| card[1] }

  total = 0
  values.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 11
    else
      total += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > 21
  end

  total
end

def display_cards(cards, player)
  case player
  when PLAYER 
    prompt("You have #{cards} for a total of #{calculate_total(cards)}.")
  when DEALER
    prompt("The dealer has #{cards[0]} and a hidden card.")
  end
end

def player_goes(cards, deck)
  loop do
    prompt("Would you like to hit or stay? (H/S)")
    answer = gets.chomp.downcase
    if answer.start_with?('h')
      cards << deck.pop
      display_cards(cards, PLAYER)
      break if busted?(cards)
    else
      break
    end
  end
end

def player_wins?(player_c, dealer_c)
  calculate_total(player_c) > calculate_total(dealer_c)
end

def busted?(cards)
  calculate_total(cards) > 21
end

def who_wins?(player_c, dealer_c)
  if player_wins?(player_c, dealer_c)
    prompt("You beat the dealer!  You win!")
  elsif busted?(dealer_c)
    prompt("The dealer busted, you win!")
  else
    prompt("The dealer has a higher total while remaining under 21, you lose...")
  end
end

def play_again?
  prompt("Would you like to play again? (Y/N)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
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

  display_cards(player_cards, PLAYER)
  display_cards(dealer_cards, DEALER)

  player_goes(player_cards, deck)

  if busted?(player_cards)
    prompt("You busted and lose!")
    if play_again?
      next
    else
      break
    end
  end
end