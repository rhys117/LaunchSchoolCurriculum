require 'pry'

def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = []
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def valid_number?(num)
  begin
    Float(num).is_a?(Numeric)
    return true
  rescue
    return false
  end
end

def player_places(brd)
  prompt "Choose a square (1-9):"
  square = gets.chomp
  loop do
    break if valid_number?(square)
    prompt "sorry, that's not a valid choice. Choose a square (1-9)"
    square = gets.chomp
  end
  brd[square.to_i] = 'X'
end

board = initialize_board
display_board(board)

player_places(board)
puts board.inspect
display_board(board)
