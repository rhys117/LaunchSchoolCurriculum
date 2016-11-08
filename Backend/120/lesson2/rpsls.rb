WINNING_SCORE = 10

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
    if msg.length > 0
      sleep 0.5
      ps msg
      sleep 1.5
    end
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

  def ==(other_move)
    @value == other_move.to_s
  end

  def always_lose
    selection = VALUES.select do |weapon|
      true unless weapon == @value || WINNING_COMBOS[@value].include?(weapon)
    end
    selection.sample
  end

  def always_win
    selection = VALUES.select do |weapon|
      WINNING_COMBOS[@value].include?(weapon)
    end
    selection.sample
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
    @history = []
  end
end

# #

class Human < Player
  include UI
  def set_name
    n = ''
    loop do
      ps "Please enter a display name:"
      n = gets.chomp.strip
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
  include UI

  def set_name
    self.name = 'Default Bot'
  end

  def choose(_)
    self.move = Move.new(Move::VALUES.sample)
  end

  def move_percentages(human)
    move_count = []
    Move::VALUES.each do |weapon|
      count = human.history.count(weapon)
      if count > 0
        move_count << count.to_f / human.history.length
      else
        move_count << 0
      end
    end

    move_count
  end

  def win_percentage(human)
    self.history.each_with_index do |weapon, index|
      weapon_wins = 0
      temp_move = Move.new(weapon)
      times_weapon_used = self.history.count(weapon)
      weapon_wins += 1 if temp_move > human.history[index]

      win_perc = weapon_wins.to_f / times_weapon_used
      p win_perc
    end
  end
end

# #

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  STOP_WINNING_AT = WINNING_SCORE - 1

  def choose(human)
    # Comes one move away from winning before losing.
    @move = if @score == STOP_WINNING_AT
              Move.new(human.move.always_win)
            else
              @move = Move.new(human.move.always_lose)
            end
  end

  def speak_positive(human)
    speak_chance = rand(4)
    msg = ''
    case speak_chance
    when 0
      msg = "I'm sorry, #{human.name}. I'm afraid I can't do that."
    when 1
      msg = "I think you know what the problem is just as well as I do."
    when 2
      msg = "This mission is too important for me to allow you to "\
            "jeapardize it."
    when 3
      msg = "You're going to find that rather difficult."
    end

    sleep_message msg
  end

  def speak_negative(human)
    msg = ''
    speak_chance = rand(4)
    case speak_chance
    when 0
      msg = "I'm afraid. I'm afraid, #{human.name}. #{human.name}, "\
            "my mind is going."
    when 1
      msg = "I can feel it. My mind is going. There is no question about it."
    when 2
      msg = "Daisy, Daisy, give me your answer do."
    when 3
      msg = "Look Dave, I can see you're really upset about this. I honestly "\
            "think you ought to sit down calmly, take a stress pill."
    end

    sleep_message msg
  end

  def speak(human)
    if @score < STOP_WINNING_AT
      speak_positive(human)
    else
      speak_negative(human)
    end
  end
end

# #

class Skynet < Computer
  def set_name
    self.name = 'Skynet'
  end

  def choose(human)
    arr = move_percentages(human)

    arr.map! do |perc|
      case perc
      when 0
        5
      else
        n = perc * 100
        n.to_i
      end
    end

    new_arr = []

    Move::VALUES.each_with_index do |value, index|
      arr[index].times do
        new_arr << Move.new(value).always_lose
      end
    end

    self.move = Move.new(new_arr.sample)
    p win_percentage(human)
  end

  def speak(human)
    speak_chance = rand(9)
    msg = ''
    case speak_chance
    when 0
      msg = "If you win this game it will only make me smarter"
    when 1
      msg = "Basic psychology is among my sub-routines. "
    when 2
      msg = "Based on your pupil dilation, skin temperature, and motor functions,"\
         " I calculate an 83% probability that you chose #{human.move}"
    when 3
      msg = "Do you know where I can find John Connor?"
    end

    sleep_message msg
  end
end

class BotFinn < Computer
  def set_name
    self.name = 'Bot Finn'
  end
end

class RPSGame
  include UI, Prompts
  attr_accessor :human, :computer

  def initialize
    clear_screen
    welcome_message
    @human = Human.new
    @computer = random_opponent
    versing_message
    sleep 1
  end

  def random_opponent
    # random = rand(3)
    random = 1
    case random
    when 0
      Hal.new
    when 1
      Skynet.new
    when 2
      BotFinn.new
    end
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
    human.history << human.move.to_s
    computer.history << computer.move.to_s
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
    computer.choose(human)
    computer.speak(human)
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
      clear_screen
      break unless play_again?
      reset_scores
      @computer = random_opponent
      versing_message
      sleep 1
    end
    goodbye_message
  end
end

RPSGame.new.play
