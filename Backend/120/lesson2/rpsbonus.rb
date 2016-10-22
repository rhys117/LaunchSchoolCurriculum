module Formatting
  def clear_screen
    system('clear') || system('cls')
  end

  def line
    puts "-----------------------------"
  end

  def line_break
    puts ''
  end
end

# ------------- #

class Move
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

# ------------- #

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

# ------------- #

# class Score
#   attr_accessor :value

#   def initialize
#     @value = 0
#   end

#   def add
#     @value += 1
#   end

#   def to_s
#     @value
#   end
# end

# ------------- #

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Thats's not a valid choice!"
    end
    self.move = Move.new(choice)
  end
end

# ------------- #

class Computer < Player
  def set_name
    self.name = ['Hal', 'R2D2', 'Skynet', 'Cyborg'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# ------------- #

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_scores
    puts "#{human.name} score: #{human.score.value}"
    puts "#{computer.name} score: #{computer.score.value}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} Won!"
      return :human
    elsif human.move < computer.move
      puts "#{computer.name} Won!"
      return :computer
    else
      puts "It's a tie!"
      return nil
    end
  end

  def increase_score(winner)

  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be either y or n"
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def score_adjustment(winner)
    human.score += 1 if :human
    computer.score += 1 if :computer
  end

  def display_scores

  end

  def play_round
    display_moves
    winner = display_winner
    score_adjustment(winner) if winner
    display_scores
    # win_history(winner)
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      play_round
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
