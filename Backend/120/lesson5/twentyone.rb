class Participant
  attr_accessor :cards

  def initialize

  end

  def hit

  end

  def stay

  end

  def busted?

  end

  def total

  end
end

class Player < Participant
  def initialize

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
  def initialize
    @human = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    deal_cards
    puts @human.cards
    puts @dealer.cards
    #show_initial_cards
    #player_turn
    #dealer_turn
    #show_result
  end

  def deal_cards
    @human.cards = @deck.two_cards
    @dealer.cards = @deck.two_cards
  end
end

TwentyOneGame.new.play
