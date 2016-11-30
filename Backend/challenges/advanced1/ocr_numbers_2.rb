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
    '9' => " _\n|_|\n _|\n"
  }.freeze

  def initialize(pipe_number)
    @pipe_number = pipe_number
  end

  def find_number_or_break
#     number = []

#     @pipe_number.split("\n").each_with_index do |block, index|
#       counter = 0
#       until block == '' || block.nil? do
#         number[counter] = [] if number[counter].nil?
#         number[counter] << block[0..2]
#         block = block[3..-1]
#         counter += 1
#       end
#     end
#     number.map! do |array|
#       array = array.join("\n")
#     end
#     number.map! { |str| str + "\n" }
#   end

  def convert
    conversion = ''
    NUMBER_BLOCKS.each do |key, block|
      conversion << key if @pipe_number.match(block)
    end
    conversion
  end
end