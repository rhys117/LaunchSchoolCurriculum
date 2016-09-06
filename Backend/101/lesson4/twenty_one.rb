require 'pry'

SUITES = ['h', 'd', 'c', 's'].freeze

MAX_NUMBER = 21
DEALER_STOP_NUM = 17

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
  card_number <<  case persons_hand[card][1]
                  when 2..10
                    persons_hand[card][1].to_s
                  when 11
                    'Jack'
                  when 12
                    'Queen'
                  when 13
                    'King'
                  else
                    'Ace'
                  end
end

def suit?(persons_hand, card)
  suit = ''
  suit << case persons_hand[card][0]
          when 'h'
            "hearts"
          when 'd'
            "diamonds"
          when 'c'
            "clubs"
          else
            "spades"
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
  face_card?(persons_hand, 0) + " of #{suit?(persons_hand, 0)}"
end

def hand_score(persons_hand)
  score = 0
  card_values = persons_hand.map { |card| card[1] }
  card_values.each do |value|
    score +=  case value
              when 1
                11
              when 10..13
                10
              else
                value
              end
  end
  # modify for aces
  card_values.select { |card| card == 1 }.count.times do
    score -= 10 if score > MAX_NUMBER
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
  player_hand_score = hand_score(player)
  dealer_hand_score = hand_score(dealer)
  return 'player' if player_hand_score > dealer_hand_score
  return 'draw' if player_hand_score == dealer_hand_score
  'dealer'
end

def print_result(player_hand, dealer_hand)
  puts "Your score: #{hand_score(player_hand)}; Dealer score:\
   #{hand_score(dealer_hand)}"
  case winner?(player_hand, dealer_hand)
  when 'player'
    prompt "You won!"
  when 'dealer'
    prompt "The dealer won!"
  else
    prompt "It's a draw"
  end
end

def show_hand_and_score(persons_hand, person)
  intro_string = ''
  intro_string = 'Your' if person == 'player'
  intro_string = 'Dealers' if person == 'dealer'

  prompt "#{intro_string} hand is: #{hand_is?(persons_hand)}"
  prompt "#{intro_string} score is: #{hand_score(persons_hand)}"
end

def player_turn!(player_hand, deck)
  loop do
    hit_or_stay = ''
    show_hand_and_score(player_hand, 'player')
    prompt "Would you like to hit or stay?"
    loop do # user input checking
      hit_or_stay = gets.chomp.downcase
      break if %w(stay hit).include?(hit_or_stay)
      prompt "I didn't understand that... would you like to STAY or HIT?"
    end

    hit!(player_hand, deck) if hit_or_stay == 'hit'
    break if bust?(player_hand) || hit_or_stay == 'stay'
  end
end

def dealer_turn!(dealer_hand, deck)
  show_hand_and_score(dealer_hand, 'dealer')

  loop do
    dealer_hand_score = hand_score(dealer_hand)
    if dealer_hand_score < DEALER_STOP_NUM
      hit!(dealer_hand, deck)
      prompt "Dealer Hits!"
      show_hand_and_score(dealer_hand, 'dealer')
    elsif dealer_hand_score <= MAX_NUMBER
      prompt "Dealer Stays!"
      break
    else
      prompt "Dealer busts! You won!"
      break
    end
  end
end

def play_again?
  prompt "would you like to play again? (y for yes)"
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

prompt "Welcome to 21."

player_wins = 0
dealer_wins = 0
game_counter = 0
loop do
  # initialize deck and player hands
  deck = initialize_deck
  dealer_hand = []
  player_hand = []

  # deal two cards to each player
  2.times do
    dealer_hand << rand_card!(deck)
    player_hand << rand_card!(deck)
  end

  puts '----------------------'

  prompt "Score: Player #{player_wins}; Dealer #{dealer_wins}" unless game_counter.zero?

  loop do
    prompt "Dealer hand is #{show_first_card(dealer_hand)} and 'hidden card'"
    puts # line break for readibility

    player_turn!(player_hand, deck)
    if bust?(player_hand) # player busts
      show_hand_and_score(player_hand, 'player')
      prompt "You busted! The dealer won"
      break
    end

    dealer_turn!(dealer_hand, deck)
    break if bust?(dealer_hand)

    print_result(player_hand, dealer_hand)
    break
  end

  if game_counter.zero?
    prompt "Would you like to play first to 5? (y or n)"
    best_of_5 = gets.chomp
    break unless best_of_5.downcase.start_with?('y')
  end

  case winner?(player_hand, dealer_hand)
  when 'player'
    player_wins += 1
  when 'dealer'
    dealer_wins += 1
  end
  game_counter += 1

  if dealer_wins == 5 || player_wins == 5
    prompt "#{winner?(player_hand, dealer_hand)} won the game!"
    prompt "Would you like to play again? (y or n)"
    play_again = gets.chomp
    game_counter = 0
    computer_wins = 0
    player_wins = 0
    break unless play_again.downcase == 'y'
  end
end

prompt "Thanks for playing 21!"
