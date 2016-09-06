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

def face_card?(persons_hand, card)
  card_number = ''
  case persons_hand[card][1] 
  when 2..10
    card_number << persons_hand[card][1].to_s
  when 11
    card_number << 'Jack'
  when 12
    card_number << 'Queen'
  when 13
    card_number << 'King'
  else
    card_number << 'Ace'
  end
end

def suit?(persons_hand, card)
  suit = ''
  case persons_hand[card][0]
  when 'h'
    suit << "hearts"
  when 'd'
    suit << "diamonds"
  when 'c'
    suit << "clubs"
  else
    suit << "spades"
  end
end

def hand_is?(persons_hand, card = 0)
  hand = ''
  loop do
    hand << face_card?(persons_hand, card)
    hand << " of #{suit?(persons_hand, card)}"
    hand << "; " unless card == persons_hand.length - 1
    
    card += 1
    break if card == persons_hand.length
  end
  hand
end

def show_first_card(persons_hand)
  hand = ''
  hand << face_card?(persons_hand, 0)
  hand << " of #{suit?(persons_hand, 0)}"
end

def hand_score?(persons_hand, card = 0)
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

    card += 1
    break if card == persons_hand.length
  end
  score
end

def hit!(persons_hand, deck)
  persons_hand << rand_card!(deck)
end

deck = initialize_deck

dealer_hand = [rand_card!(deck), rand_card!(deck)]
player_hand = [rand_card!(deck), rand_card!(deck)]

prompt "Welcome to 21."
prompt "Dealer hand is #{show_first_card(dealer_hand)} and 'hidden card'"
puts # line break for readibility

loop do
  prompt "Your hand is: #{hand_is?(player_hand)}"
  prompt "Your hand is worth: #{hand_score?(player_hand)}"
  prompt "Would you like to hit or stay?"
  hit_or_stay = gets.chomp.downcase

  if hit_or_stay == 'hit'
    hit!(player_hand, deck)
  elsif hit_or_stay == 'stay' || bust(player_hand)
    break
  else
    prompt "sorry I didn't understand that"
  end
end

