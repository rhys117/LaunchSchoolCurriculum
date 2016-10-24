WINNING_SCORE = 1.freeze

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

  def goodbye_message
    ps "Thanks for playing!"
  end

  def versing_message
    ps "#{human.name} you will be facing #{computer.name}:"
  end

  def display_choices
    ps "#{human.name} chose: #{human.move}"
    ps "#{computer.name} chose: #{computer.move}"
  end

  def display_round_winner(winner)
    case winner
    when :human
      ps "#{human.name} won this round!"
    when :computer
      ps "#{computer.name} won this round!"
    when :tie
      ps "It's a tie this round!"
    end
  end

  def display_winner(winner)
    case winner
    when :human
      ps "#{human.name} Won!"
    when :computer
      ps "#{computer.name} Won!"
    when :tie
      ps "It's a tie!"
    end
  end

  def display_score
    msg = "Score: #{human.name} - #{human.score}/#{WINNING_SCORE} "\
          "|| #{computer.name} - #{computer.score}/#{WINNING_SCORE}"
    ps msg
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
    WINNING_COMBOS[@value].include?(other_move.to_s)
  end

  def to_s
    @value
  end

  def to_sym
    @value.to_sym
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

  def increase_score(winner)
    human.score += 1 if winner == :human
    computer.score += 1 if winner == :computer
  end

  def round_winner
    if human.move > computer.move
      :human
    elsif human.move == computer.move
      :tie
    else
      :computer
    end
  end

  def update_history
    human.history[human.move.to_sym] += 1
    computer.history[computer.move.to_sym] += 1
  end

  def winner?
    computer.score == WINNING_SCORE || human.score == WINNING_SCORE
  end

  def who_won
    return :computer if computer.score == WINNING_SCORE
    return :human if human.score == WINNING_SCORE
  end

  def play_again?
    choice = ''
    loop do
      ps "Would you like to play again? (y)es or (n)o"
      choice = gets.chomp.downcase
      break if ['y', 'yes', 'no', 'n'].include?(choice)
    end
    return true if choice == 'y' || choice == 'yes'
    return false if choice == 'n' || choice == 'no'
  end

  def reset_scores
    computer.score = 0
    human.score = 0
  end

  def one_round
    clear_screen
    display_score
    line
    human.choose
    computer.choose
    display_choices
    winner = round_winner
    display_round_winner(winner)
    increase_score(winner)
    update_history
    line
    display_score
    sleep 2
  end

  def play
    loop do
      one_round until winner?
      display_winner(who_won)
      break unless play_again?
      reset_scores
    end
    goodbye_message
  end
end

RPSGame.new.play
