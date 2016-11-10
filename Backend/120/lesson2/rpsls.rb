require 'pry'

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
    if msg.length.positive?
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
    line
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
    line
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
    line
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

  def always_win
    selection = VALUES.select do |weapon|
      true unless weapon == @value || WINNING_COMBOS[@value].include?(weapon)
    end
    selection.sample
  end

  def always_lose
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

  def weapon_win_count(weapon, other_player)
    count = 0
    history.each_with_index do |_, index|
      if history[index] == weapon &&
         history[index] > other_player.history[index]
        count += 1
      end
    end
    count
  end

  def win_percentage(other_player)
    percentages = []

    Move::VALUES.each do |weapon|
      win_count = weapon_win_count(weapon, other_player)
      times_used = history.count(weapon)

      percentages << win_count.to_f / times_used if win_count.positive?
      percentages << 0 if win_count.zero?
    end
    percentages.map { |dec_perc| (dec_perc * 100).to_i }
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
      move_count << count.to_f / human.history.length if count.positive?
      move_count << 0 if count.zero?
    end

    move_count
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
              Move.new(human.move.always_lose)
            else
              @move = Move.new(human.move.always_win)
            end
  end

  def speak_positive(human)
    speak_chance = rand(7)
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
    speak_chance = rand(7)
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

  def fill_sample_array(percent_won, percent_lost)
    sample_array = []
    Move::VALUES.each_with_index do |weapon, index|
      weapon_win_percent = percent_won[index]
      weapon_lost_percent = percent_lost[index]

      if weapon_win_percent.positive?
        weapon_win_percent.times { sample_array << weapon }
      elsif weapon_win_percent.zero? && weapon_lost_percent.positive?
        10.times { sample_array << weapon }
      else
        25.times { sample_array << weapon }
      end
    end
    sample_array
  end

  def choose(human)
    percent_won = win_percentage(human)
    percent_lost = win_percentage(self)

    sample_array = fill_sample_array(percent_won, percent_lost)

    self.move = Move.new(sample_array.sample)
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
      msg = "Based on your pupil dilation, skin temperature, and "\
            "motor functions, I calculate an 83% probability that "\
            "you chose #{human.move}"
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

  def choose(human)
    percent_array = move_percentages(human).map { |num| num *= 100; num.to_i }

    sample_array = []

    Move::VALUES.each_with_index do |weapon, index|
      if percent_array[index].positive?
        percent_array[index].times do
          sample_array << Move.new(weapon).always_lose
        end
      else
        5.times do
          sample_array << Move.new(weapon).always_lose
        end
      end
    end

    self.move = Move.new(sample_array.sample)
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
    human.history << human.move
    computer.history << computer.move
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
    human.choose
    computer.choose(human)
    computer.speak(human)
    display_choices
    winner = round_winner
    display_round_winner(winner)
    increase_score(winner)
    update_history
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
