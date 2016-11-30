class OCR
  NUMBER_BLOCKS = {
    '0' => " _\n| |\n|_|\n",
    '1' => "\n  |\n  |\n",
    '2' => " _\n _|\n|_\n",
    '3' => " _\n _|\n _|\n",
    '4' => "\n|_|\n  |\n",
    '5' => " _\n|_\n _|\n",
    '6' => " _\n|_\n|_|\n",
    '7' => " _\n  |\n  |\n",
    '8' => " _\n|_|\n|_|\n",
    '9' => " _\n|_|\n _|\n",
  }.freeze

  BREAK_CONVERSION = 'xxx'


  def initialize(pipe_str)
    @pipe_string = pipe_str
    @pipe_numbers = find_number_blocks
  end

  def find_breaks
    breaks = []
    @pipe_string.chars.each_with_index do |char, index|
      if char == "\n" && @pipe_string[index + 1] == "\n"
        @pipe_string[index] = "\nxxx"
      end
    end
    breaks
  end

  def find_number_blocks
    pipe_numbers = []
    @pipe_string.split("\n").each do |block|
      counter = 0
      until block == '' && counter.positive?
        p block
        pipe_numbers[counter] = '' if pipe_numbers[counter].nil?
        pipe_numbers[counter] << block.slice!(block[0..2]).rstrip + "\n"
        counter += 1
      end
    end
    pipe_numbers
  end

  def match_pair(block)
    NUMBER_BLOCKS.each do |key, match_block|
      return key if block == match_block
    end
    '?'
  end

  def convert
    conversion = ''
    @pipe_numbers.each do |block|
      conversion << match_pair(block)
    end
    conversion
  end
end

text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER

  text2 = <<-NUMBER.chomp
    _
  || |
  ||_|

    NUMBER

 a = OCR.new(text)
p a.find_breaks
p a.find_number_blocks
p b = OCR.new(text2).find_breaks
