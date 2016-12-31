class WordProblem
  attr_reader :result
  ACTIONS = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/ }

  def initialize(input)
    @input = input
    processing
    raise ArgumentError.new('incompatable statement') unless valid_problem?
  end

  def answer
    result = @numbers.first
    @operators.each_with_index do |op, idx|
      result = result.send(op, @numbers[idx + 1])
    end
    result
  end

  private

  def processing
    @numbers = @input.scan(/-?\d+/).map(&:to_i)
    @operators = @input.scan(/#{ACTIONS.keys.join('|')}/).map { |word_operator| ACTIONS[word_operator] }
  end

  def valid_problem?
    return false if @operators.empty?
    @input.size > 1 && @numbers.size == @operators.size + 1
  end
end