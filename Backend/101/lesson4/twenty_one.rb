require 'pry'

SUITES = ['h', 'd', 'c', 's'].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  (1..13).each do |num| # hearts
   new_deck << [SUITES[0], num]
  end

  (1..13).each do |num| # diamonds
   new_deck << [SUITES[1], num]
  end

  (1..13).each do |num| # clubs
   new_deck << [SUITES[2], num]
  end

  (1..13).each do |num| # spades
   new_deck << [SUITES[3], num]
  end
  
  new_deck
end

def rand_card!(deck)
  deck.delete_at(rand(deck.length))
end

def hand_is?(persons_hand, card = 0, num_of_cards = persons_hand.length)
  hand = ''

  loop do
    case persons_hand[card][1] 
    when 2..10
      hand << persons_hand[card][1].to_s
    when 11
      hand << 'jack'
    when 12
      hand << 'queen'
    when 13
      hand << 'king'
    else
      hand << 'ace'
    end

    case persons_hand[card][0]
    when 'h'
      hand << " of hearts; "
    when 'd'
      hand << " of diamonds; "
    when 'c'
      hand << " of clubs; "
    else
      hand << " of spades; "
    end

    num_of_cards -= 1
    card += 1
    break if num_of_cards == 0
  end
  hand
end

def hand_score?(persons_hand, card = 0, num_of_cards = persons_hand.length)
  score = 0

  loop do
    case persons_hand[card][1]
    when 2..10
      score += persons_hand[card][1]
    when 11..13
      score += 10
    when 1
      score += 1
    end

    num_of_cards -= 1
    card += 1
    break if num_of_cards == 0
  end
  score
end

deck = initialize_deck

dealer_hand = [rand_card!(deck), rand_card!(deck)]

player_hand = [rand_card!(deck), rand_card!(deck), rand_card!(deck)]

puts player_hand

prompt "Your hand is: #{hand_is?(player_hand)}"
prompt "Dealer's hand is #{hand_is?(dealer_hand)}"

prompt "#{hand_score?(player_hand)}"