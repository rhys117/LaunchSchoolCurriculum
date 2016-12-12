class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

class PingGame
  MIN_OF_RANGE = 1
  MAX_OF_RANGE = 100

  def initialize(min=MIN_OF_RANGE, max=MAX_OF_RANGE)
    @min = min
    @max = max
    @number = (min..max).to_a.sample
    @max_guesses = Math.log2(max - min).to_i + 1
    @guesses = 0
    @guess = nil
  end

  def play
    loop do
      remaining_message
      user_guesses
      display_result(result)
      break if game_over?
    end
  end

  def remaining_message
    remaining_guesses = @max_guesses - @guesses
    if remaining_guesses > 1
      puts "You have #{remaining_guesses} guesses remaining."
    else
      puts "You have 1 guess remaining."
    end
    print "Enter a number between #{@min} and #{@max}: "
  end

  def user_guesses
    guess = nil
    loop do
      guess = gets.chomp
      break if guess.is_i? && (1..100) === guess.to_i
      print "Invalid guess. Enter a number between #{@min} and #{@max}: "
    end
    @guess = guess.to_i
    @guesses += 1
  end

  def out_of_guesses
    @guesses == @max_guesses
  end

  def display_result(result)
    case result
    when :player_won
      puts "You win!"
    when :higher
      puts "Your guess is too high."
    when :lower
      puts "Your guess is too low."
    end

    puts "You are out of guesses. You lose." if out_of_guesses
  end

  def result
    if @guess == @number
      :player_won
    elsif @guess > @number
      :higher
    elsif @guess < @number
      :lower
    end
  end

  def game_over?
    return true if out_of_guesses || result == :player_won
    false
  end
end

game = PingGame.new(501, 1500)
game.play