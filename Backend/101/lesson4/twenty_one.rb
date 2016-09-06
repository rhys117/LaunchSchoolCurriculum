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

def hand_score(persons_hand)
  score = 0
  card_values = persons_hand.map { |card| card[1] }
  
  card_values.each do |value|
    if value == 1
      score += 11
    elsif value >= 10
      score += 10
    else
      score += value
    end
  end

  card_values.select { |card| card == 1 }.count.times do
    score -= 10 if score > 21
  end
  score
end

def hit!(persons_hand, deck)
  persons_hand << rand_card!(deck)
end

def bust?(persons_hand)
  return false if hand_score(persons_hand) < 22
  true
end

def winner?(player, dealer)
  return 'player' if hand_score(player) > hand_score(dealer)
  return 'draw' if hand_score(player) == hand_score(dealer)
  return 'dealer'
end

def print_result(player_hand, dealer_hand)
  puts "Your score: #{hand_score(player_hand)}; Dealer score: #{hand_score(dealer_hand)}"
  case winner?(player_hand, dealer_hand)
  when 'player'
    prompt "You won!"
  when 'dealer'
    prompt "The dealer won!"
  else
    prompt "It's a draw"
  end
end

def player_turn!(player_hand, deck)
  loop do
    prompt "Your hand is: #{hand_is?(player_hand)}"
    prompt "Your hand is worth: #{hand_score(player_hand)}"
    prompt "Would you like to hit or stay?"
    hit_or_stay = gets.chomp.downcase

    hit!(player_hand, deck) if hit_or_stay == 'hit'
    break if bust?(player_hand) || hit_or_stay == 'stay'
  end
end

def dealer_turn!(dealer_hand, deck)
  prompt "Dealer hand is #{hand_is?(dealer_hand)}"
  prompt "Dealers score: #{hand_score(dealer_hand)}"
  
  loop do
    if hand_score(dealer_hand) < 18
      hit!(dealer_hand, deck)
      prompt "Dealer Hit!"
      prompt "Dealer hand is #{hand_is?(dealer_hand)}"
      prompt "Dealers score: #{hand_score(dealer_hand)}"
    elsif hand_score(dealer_hand) < 22
      prompt "Dealer Stays!"
      break
    else
      prompt "Dealer busts! You won!"
      break
    end
  end
end


prompt "Welcome to 21."

loop do
  deck = initialize_deck

  dealer_hand = [rand_card!(deck), rand_card!(deck)]
  player_hand = [rand_card!(deck), rand_card!(deck)]
  
  loop do
    prompt "Dealer hand is #{show_first_card(dealer_hand)} and 'hidden card'"
    puts # line break for readibility
      
    player_turn!(player_hand, deck)

    if bust?(player_hand)
      prompt "Your hand is: #{hand_is?(player_hand)}"
      prompt "Your hand is worth: #{hand_score(player_hand)}"
      prompt "You busted! The dealer won" 
      break   
    end

    dealer_turn!(dealer_hand, deck)
      
    break if bust?(dealer_hand)

    print_result(player_hand, dealer_hand)
    break
  end

  prompt "would you like to play again? (y for yes)"
  play_again = gets.chomp
  break unless play_again.downcase[0] == 'y'
end

prompt "Thanks for playing 21!"
