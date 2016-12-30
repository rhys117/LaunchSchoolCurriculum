class WordProblem
  attr_reader :result
  ACTIONS = %w(plus minus multipled divided)

  def initialize(input)
    @split_input = input.split
    @result = 0
    @number = nil
  end

  def answer
    @split_input.each_with_index do |word, idx|
      if ACTIONS.include?(word)
        
      end
  end

  private

  def plus
    @result += @number
  end

  def minus
    @result -= @number
  end

  def multiplied
    @result *= @number
  end

  def divided
    @result /= @number
  end
end