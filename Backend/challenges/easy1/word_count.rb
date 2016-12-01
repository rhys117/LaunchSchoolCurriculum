class Phrase
  attr_reader :word_count

  def initialize(str)
    @input = str
    @word_count = convert_input_to_count
  end

  def convert_input_to_count
    word_count = Hash.new(0)
    word_array = @input.downcase.scan(/\b[\w']+\b/)

    word_array.each do |word|
      word_count[word] += 1
    end
    word_count
  end
end