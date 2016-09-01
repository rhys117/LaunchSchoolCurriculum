require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

WINNING_COMBOS =  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}; Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def valid_number?(num)
  Float(num).is_a?(Numeric)
  return true if num.to_i < 10
rescue; return false
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def square_taken?(board, square)
  board.keys.select { |num| board[num] == INITIAL_MARKER }.include?(square.to_i)
end

def player_places!(board)
  square = ''
  loop do
    prompt "Choose a square #{empty_squares(board).join(', ')}"
    square = gets.chomp

    # check user input
    break if square_taken?(board, square) && valid_number?(square)

    prompt "That's not a valid number."
  end

  board[square.to_i] = PLAYER_MARKER
end

def computer_places!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_winner(board)
  WINNING_COMBOS.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_places!(board)

    break if someone_won?(board) || board_full?(board)

    computer_places!(board)
    puts board.inspect

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Would you like to play again? (y or n)"
  again_input = gets.chomp
  break unless again_input.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
