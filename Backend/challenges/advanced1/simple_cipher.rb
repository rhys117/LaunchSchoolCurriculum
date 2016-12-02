class Cipher
  ALPHABET = ('a'..'z').to_a

  def initialize(str='')
    @key = str
    @cipherbet = find_cipherbet
  end

  def find_cipherbet

  end

  def encode(msg)
    result = ''

    msg.each_char do |char|
      result << ALPHABET[adjust_index_forward(char)]
    end
    result
  end

  def decode(msg)
    result = ''

    msg.each_char do |char|
      result << ALPHABET[adjust_index_back(char)]
    end
    result
  end

  def adjust_index_forward(char)
    alpha_index = ALPHABET.find_index(char)
    adjusted = alpha_index + 3
    adjusted -= 26 if adjusted > 26
    adjusted
  end

  def adjust_index_back(char)
    alpha_index = ALPHABET.find_index(char)
    adjusted = alpha_index - 3
    adjusted = 26 - adjusted.cat if adjusted < 0
    adjusted
  end
end

a = Cipher.new
p a.encode("iamapandabearz")
p a.decode("ldpdsdqgdehdu") #=> "iamapandabear"