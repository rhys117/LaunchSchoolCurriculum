class Scrabble
  LETTER_SCORES = { 'aeioulnrst' => 1,
                    'dg' => 2,
                    'bcmp' => 3,
                    'fhvwy' => 4,
                    'k' => 5,
                    'jx' => 8,
                    'qz' => 10 }

  def initialize(str)
    @word = str
  end

  def score
    return 0 if not_valid?
    score = 0
    @word.downcase.split('').each do |letter|
      LETTER_SCORES.each do |key, value|
        score += value if key.include?(letter)
      end
    end
    score
  end

  def self.score(str)
    new(str).score
  end

  def not_valid?
    @word.class != String
  end
end

p test_var = Scrabble.new('a').score