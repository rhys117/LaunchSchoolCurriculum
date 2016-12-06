module UI
  def clear_screen
    system('clear') || system('cls')
  end

  def puts_styled(msg)
    puts "--> #{msg}"
  end

  def line_break
    puts ''
  end

  def horizontal_line
    puts "----------------------------------"
  end

  def sleep_message(msg)
    if msg.length.positive?
      sleep 0.5
      puts_styled msg
      sleep 1.5
    end
  end

  def joiner(array, char=', ', word='and')
    if array.size > 1
      last_part_string = " #{word} #{array.last}"
      first_part_string = array[0..-2].join(char)
      joined_string = first_part_string + last_part_string
    else
      joined_string = array[0].to_s
    end
    joined_string
  end
end

class Participant
  attr_accessor :cards
  attr_reader :name

  def initialize
    set_name
  end

  def set_name
    @name = 'Player'
  end

  def score
    score = cards.map(&:value).inject(:+)
    cards.select { |card| card.face == 'Ace' }.count.times do
      score -= 10 if score > 21
    end
    score
  end

  def bust?
    score > 21
  end
end

class Player < Participant
  include UI

  attr_reader :chips

  def initialize
    set_name
    @chips = Chips.new
  end

  def set_name
    name = ''

    loop do
      puts_styled "What's your name?"
      name = gets.chomp.strip
      break unless name.empty?
      puts_styled "Whoops! you must have a name!"
    end
    @name = name
  end
end

class Dealer < Participant
  def initialize
    @name = 'Dealer'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = new_pack
  end

  def new_pack
    cards = []
    52.times do |num|
      cards << Card.new(num)
    end
    cards
  end

  def random_card!
    @cards.delete_at(rand(@cards.length))
  end

  def five_cards
    dealt_cards = []
    5.times { dealt_cards << random_card! }
    dealt_cards
  end

  def refresh
    @cards = new_pack
  end

  def hit(player)
    player.cards << random_card!
  end
end

class Card
  SUITES = %w(Diamonds Hearts Spades Clubs).freeze
  FACES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
  DECK_VALUES = SUITES.product(FACES)

  attr_reader :suit, :face, :value

  def initialize(num)
    @card_index = num
    @suit = find_suit
    @face = find_face
    @value = find_value
  end

  def find_suit
    DECK_VALUES[@card_index][0]
  end

  def find_face
    DECK_VALUES[@card_index][1]
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end

class Chips
  include UI
  attr_accessor :total, :bet

  INITIAL_CHIP_COUNT = 25

  def initialize
    @total = INITIAL_CHIP_COUNT
    @bet = 0
  end

  def set_bet_amount
    clear_screen
    horizontal_line
    puts_styled "You have #{@total} chips"
    loop do
      puts_styled "How many would you like to bet?"
      @bet = gets.chomp.to_i
      break if chips_bet_valid?
      puts_styled "Whoops! you must choose a valid amount. "\
         "You have #{@total} chips"
    end
    @total -= @bet
    clear_screen
  end

  def chips_bet_valid?
    @bet <= @total && @bet.positive?
  end

  def winnings
    @bet * 2
  end

  def to_s
    @total.to_s
  end

  def no_chips?
    @total.zero?
  end

  def reset
    @total = INITIAL_CHIP_COUNT
  end

  def update_total(winner)
    @total = case winner
             when :player
               @total + winnings
             when :dealer
               @total
             when :tie
               @total + @bet
             end
  end
end