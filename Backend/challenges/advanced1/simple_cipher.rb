require 'pry'

class Cipher
  attr_reader :key

  ALPHABET = ('a'..'z').to_a
  DEFAULT_KEY = (0...100).map{ ALPHABET.to_a[rand(ALPHABET.size)] }.join

  def initialize(str=DEFAULT_KEY)
    @key = str
    @forward_alphabet = []
    @backward_alphabet = []
    find_cipherbets
  end

  def find_cipherbets
    cipherbet_array = @key.split('')
    shift_distances = find_shift_distances

    ALPHABET.each_with_index do |char, index|
      distance = shift_distances[index]
      @forward_alphabet << ALPHABET[adjust_index_forward(char, distance)]
      @backward_alphabet << ALPHABET[adjust_index_back(char, distance)]
    end
  end

  def adjust_index_forward(char, distance)
    alpha_index = ALPHABET.find_index(char)
    adjusted = alpha_index + distance
    adjusted -= 26 if adjusted > 26
    adjusted
  end

  def adjust_index_back(char, distance)
    alpha_index = ALPHABET.find_index(char)
    adjusted = alpha_index - distance
    adjusted = 26 - adjusted.cat if adjusted < 0
    adjusted
  end

  def find_shift_distances
    result = []
    @key.each_char do |char|
      result << ALPHABET.find_index(char)
    end
    result
  end

  def encode(msg)
    result = ''

    msg.each_char do |char|
      normal_index = ALPHABET.find_index(char)
      result << @forward_alphabet[normal_index]
    end
    result
  end

  def decode(msg)
    result = ''

    msg.each_char do |char|
      normal_index = ALPHABET.find_index(char)
      result << @backward_alphabet[normal_index]
    end
    result
  end
end

a = Cipher.new
p a.encode("iamapandabearz")
p a.decode("ldpdsdqgdehdu") #=> "iamapandabear"