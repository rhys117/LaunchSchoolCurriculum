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
    @breaks = find_breaks
    @pipe_numbers = convert_multiline
  end

  def find_number_blocks(str)
    pipe_numbers = []
    str.split("\n").each do |block|
      counter = 0
      until block == '' && counter.positive?
        block
        pipe_numbers[counter] = '' if pipe_numbers[counter].nil?
        pipe_numbers[counter] << block.slice!(block[0..2]).rstrip + "\n"
        counter += 1
      end
    end
    pipe_numbers
  end

  def convert_multiline
  result = []
    @pipe_string.split("\n\n").each do |block|
      block.gsub!("\n\n", '')
      result << find_number_blocks(block)
    end
   result.flatten
  end

  def test(tester)
    pipe_numbers = []
    tester.split("\n").each do |block|
      counter = 0
      until block == '' && counter.positive?
        block
        pipe_numbers[counter] = '' if pipe_numbers[counter].nil?
        pipe_numbers[counter] << block.slice!(block[0..2]).rstrip + "\n"
        counter += 1
      end
    end
    p pipe_numbers
  end

  def find_breaks
    breaks = []
    @pipe_string.chars.each_with_index do |char, idx|
      if char == "\n" && @pipe_string[idx + 1] == "\n"
        breaks << (idx.to_f / 9).round
      end
    end
    breaks
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
    @breaks.reverse_each do |idx|
      conversion.insert(idx, ',')
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
a.find_breaks
p a.convert
p b = OCR.new(text2).convert
