module UI
  def clear_screen
    system('clear') || system('cls')
  end

  def ps(msg)
    puts "--> #{msg}"
  end

  def line_break
    puts ''
  end

  def line
    puts "----------------------------------"
  end

  def sleep_message(msg)
    if msg.length.positive?
      sleep 0.5
      ps msg
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
    score = self.cards.map(&:value).inject(:+)
  end

  def bust?
    self.score > 21
  end
end

class Player < Participant
  include UI

  INITIAL_CHIP_COUNT = 25

  attr_accessor :chips

  def initialize
    set_name
    @chips = INITIAL_CHIP_COUNT
  end
end

class Dealer < Participant
  def initialize

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
      cards << Card.new(num + 1)
    end
    cards
  end

  def random_card!
    @cards.delete_at(rand(@cards.length))
  end

  def two_cards
    dealt_cards = []
    2.times { dealt_cards << random_card! }
    dealt_cards
  end

  def hit(player)
    player.cards << random_card!
  end
end

class Card
  SUITES = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
  FACES = (1..13).to_a

  attr_reader :suit, :face, :value

  def initialize(num)
    @card_of_52 = num
    @value = find_value
    @suit = find_suit
    @face = find_face
  end

  def find_value
    number = 0
    case @card_of_52
    when 1..13
      number = @card_of_52
    when 14..26
      number = @card_of_52 - 13
    when 27..39
      suit = @card_of_52 - 26
    when 40..52
      suit = @card_of_52 - 39
    end
  end

  def find_suit
    suit = nil
    case @card_of_52
    when 1..13
      suit = SUITES[0]
    when 14..26
      suit = SUITES[1]
    when 27..39
      suit = SUITES[2]
    when 40..52
      suit = SUITES[3]
    end
    suit
  end

  def find_face
    case @value
    when 1
      'Ace'
    when 2..10
      @value.to_s
    when 11
      'Jack'
    when 12
      'Queen'
    when 13
      'King'
    end
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end

class TwentyOneGame
  include UI

  attr_accessor :human, :dealer, :deck

  def initialize
    @human = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    welcome_message
    deal_cards
    show_hand_with_hidden
    player_turn
    #dealer_turn
    #show_result
  end

  def welcome_message
    clear_screen
    ps "Welcome to 21!"
  end

  def goodbye_message
    ps "Thanks for playing 21!"
  end

  def deal_cards
    human.cards = deck.two_cards
    dealer.cards = deck.two_cards
  end

  def show_hand_with_hidden
    ps "#{human.name} has #{joiner(human.cards)}"
    ps "Score: #{human.score}"
    line
    ps "Dealer has #{dealer.cards.first} and a hidden card"
    line
  end

  def hit_or_stay
    answer = nil
    loop do
      ps "Would you like to (H)it or (S)tay"
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      ps "Sorry must select either H for Hit or S for Stay"
    end
    answer
  end

  def player_turn
    loop do
      answer = hit_or_stay
      deck.hit(human) if answer == 'h'
      clear_screen
      show_hand_with_hidden
      break if answer == 's' || human.bust?
    end
  end
end

TwentyOneGame.new.play
