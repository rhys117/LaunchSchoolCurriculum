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
end

module Prompts
  def welcome_message
    ps "Welcome to rock, paper, scissors, lizard, spock!"
  end

  def versing_message
    ps "#{human.name} you will be facing #{computer.name}:"
  end

  def display_choices
    ps "#{human.name} chose: #{human.move}."
    ps "#{computer.name} chose: #{computer.move}."
  end

  def display_winner
    if human.move::value > computer.move::value
      ps "#{human.name} Won!"
    elsif human.move::value == computer.move::value
      ps "It's a tie"
    else
      ps "#{computer.name} Won!"
    end
  end
end

# #

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  WINNING_COMBOS = { 'rock' => %w(scissors lizard),
                     'paper' => %w(spock rock),
                     'scissors' => %w(lizard paper),
                     'spock' => %w(scissors rock),
                     'lizard' => %w(spock paper) }.freeze

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_COMBOS[@value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

# #

class Player
  attr_accessor :name, :score, :move, :history

  def initialize
    set_name
    @score = 0
    @history = { rock: 0, paper: 0, scissors: 0,
                 lizard: 0, spock: 0 }
  end
end

# #

class Human < Player
  include UI
  def set_name
    n = ''
    loop do
      ps "Please enter a display name:"
      n = gets.chomp
      break unless n.empty?
      ps "Sorry you must enter a name!"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      ps "Choose your weapon: Rock, Paper, Scissors, Lizard, Spock"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      ps "Sorry that's not a valid selection!"
    end
    self.move = Move.new(choice)
  end
end

# #

class Computer < Player
  def set_name
    self.name = ['Hal', 'Skynet', 'Bot Finn'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# #

class RPSGame
  include UI, Prompts
  attr_accessor :human, :computer

  def initialize
    clear_screen
    welcome_message
    @human = Human.new
    @computer = Computer.new
    versing_message
  end

  def one_round
    clear_screen
    line
    human.choose
    computer.choose
    display_choices
    display_winner
  end
end

RPSGame.new.one_round
