require 'pry'

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
  def display_welcome_message
    ps "Welcome to Tic, Tac Toe!"
  end

  def display_goodbye_message
    ps "Thanks for playing Tic, Tac, Toe!"
  end

  def display_board(clear = true)
    clear_screen if clear
    ps "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
  end

  def display_result
    display_board

    case board.detect_winner
    when human.marker
      ps "You Won!"
    when computer.marker
      ps "Computer Won!"
    else
      ps "It's a Tie!"
    end
  end
end

class Board
  WINNING_LINES =  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                   [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                   [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def detect_winner
    human_marker = TTTGame::HUMAN_MARKER
    computer_marker = TTTGame::COMPUTER_MARKER

    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return human_marker
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return computer_marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INTIIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INTIIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INTIIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker= marker
  end
end

class TTTGame
  include Prompts, UI

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def human_moves
    ps "Choose a square #{board.unmarked_keys.join(', ')}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      ps "Sorry, not a valid choice"
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def play_again?
    answer = nil
    loop do
      ps "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      ps "Sorry must be y or n"
    end

    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      display_board(false)
      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.full? || board.someone_won?

        display_board
      end
      display_result
      break unless play_again?
      board.reset
      clear_screen
      ps "Let's play again!"
      puts ''
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play