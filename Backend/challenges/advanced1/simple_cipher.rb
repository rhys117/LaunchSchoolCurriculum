class Cipher
  ALPHABET = ('a'..'z').to_a
  DEFAULT_KEY = Array.new(100) { Array('a'..'z').sample }.join
  attr_reader :key

  def initialize(str=DEFAULT_KEY)
    @key = str
    raise ArgumentError.new('can only cantain a-z lowercase') if invalid_key?
  end

    def encode(msg)
    process_msg(msg, :+)
  end

  def decode(msg)
    process_msg(msg, :-)
  end

  private

  def invalid_key?
    @key.split('').select { |char| char =~ /[a-z]/ }.size != @key.length
  end

  def process_msg(msg, processer)
    result = ''
    msg.split('').each_with_index do |char, idx|
      shifter_array = [ALPHABET.index(char), ALPHABET.index(@key[idx])]
      adjusted_index = shifter_array.inject(processer)%26
      result << ALPHABET[adjusted_index]
    end
    result
  end
end