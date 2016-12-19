FREE_SPACE = '_'.freeze
WHITE = 'W'.freeze
BLACK = 'B'.freeze

class Queens
  attr_reader :board, :white, :black
  DEFUALT_BLACK = [7, 3]
  DEFAULT_WHITE = [0, 3]

  def initialize(black: DEFUALT_BLACK, white: DEFAULT_WHITE)
    @board = ChessBoard.new
    check_input(white, black)
    @white = white
    @black = black
    place_pieces
  end

  def check_input(white, black)
    raise ArgumentError.new('pieces occupy same space') if white == black

    ranges = Proc.new { |num| num < 0 || num > 7 }
    if white.any?(&ranges) || black.any?(&ranges)
      raise ArgumentError.new('invalid space')
    end

    if white.length != 2 || black.length != 2
      raise ArgumentError.new('invalid input')
    end
  end

  def place_pieces
    @board.place_piece(WHITE, @white)
    @board.place_piece(BLACK, @black)
  end

  def to_s
    @board.to_s
  end

  def attack?
    # check same row
    return true if @white.first == @black.first
    # check same collum
    return true if @white.last == @black.last
    # check diagnols
    (@white.first - @black.first).abs == (@white.last - @black.last).abs
  end
end

class ChessBoard
  def initialize
    @board = new_board
  end

  def new_board
    @board = Array.new(8){Array.new(7)}
    (0..7).each do |row|
      (0..7).each do |cell|
        @board[row][cell] = FREE_SPACE
      end
    end
    @board
  end

  def to_s
    board_string = ''
    @board.each do |row|
      board_string << row.join(" ") + "\n"
    end
    # return board without last line break
    board_string[0..-2]
  end

  def place_piece(color, space)
    @board[space.first][space.last] = color
  end
end