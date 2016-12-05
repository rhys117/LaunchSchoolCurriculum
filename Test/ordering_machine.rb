module UI
  def clear_screen
    system('clear') || system('cls')
  end

  def puts_styled(msg)
    puts "--> #{msg}"
  end

  def line_break
    puts ''
  end

  def horizontal_line
    puts "----------------------------------"
  end

  def sleep_message(msg)
    if msg.length.positive?
      sleep 0.5
      puts_styled msg
      sleep 1.5
    end
  end

  def joiner(array, char=', ', word='and')
    if array.size > 1
      last_part_string = " #{word} #{array.last}"
      first_part_string = array[0..-2].join(char)
      joined_string = first_part_string + last_part_string
    else
      joined_string = array[0].to_s
    end
    joined_string
  end
end

class Order
  include UI
  attr_accessor :input, :list, :sorted

  def initialize
    @input = ''
    @list = input_to_array
    @sorted = sort_list
  end

  def input_to_array
    @input.split(',').map(&:downcase)
  end

  def sort_list
    @list.map!(&:strip)
    @list.sort!.join("\n")
  end

  def sort_again?
    horizontal_line
    answer = ''
    loop do
      puts_styled "Would you sort another list? (y/n)"
      answer = gets.chomp.downcase.strip
      break if ['y', 'n', 'q'].include?(answer)
      puts_styled "Sorry, must choose y for yes or n for no."
    end
    answer == 'y'
  end

  def process
    clear_screen

    loop do
      horizontal_line
      puts_styled "enter the items you would like to sort seperated by a comma (,)"
      horizontal_line
      @input = gets.chomp
      @list = input_to_array
      puts sort_list
      break unless sort_again?
    end
  end
end


Order.new.process
