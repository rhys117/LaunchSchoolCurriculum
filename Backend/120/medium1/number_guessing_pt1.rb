class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

class PingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  def initialize
    @number = RANGE.to_a.sample
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
    remaining_guesses = MAX_GUESSES - @guesses
    if remaining_guesses > 1
      puts "You have #{remaining_guesses} guesses remaining."
    else
      puts "You have 1 guess remaining."
    end
    print "Enter a number between 1 and 100: "
  end

  def user_guesses
    guess = nil
    loop do
      guess = gets.chomp
      break if guess.is_i? && (1..100) === guess.to_i
      print "Invalid guess. Enter a number between 1 and 100: "
    end
    @guess = guess.to_i
    @guesses += 1
  end

  def out_of_guesses
    @guesses == MAX_GUESSES
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

game = PingGame.new
game.play