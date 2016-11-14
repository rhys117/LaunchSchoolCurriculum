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

  def goodbye_message
    ps "Thanks for playing!"
  end

  def display_board
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
end

class Board
  INTIIAL_MARKER = " "

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INTIIAL_MARKER) }
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker= marker
  end

  def play

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
    ps "Choose a square between 1 - 9: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      ps "Sorry, not a valid choice"
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at((1..9).to_a.sample, computer.marker)
  end

  def play
    display_welcome_message
    display_board
    loop do
      human_moves

      # break if someone_won? || board_full?

      computer_moves
      
      display_board
      # break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play