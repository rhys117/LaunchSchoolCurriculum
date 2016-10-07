BLOCK = [['B', 'O'], ['X', 'K'], ['D', 'Q'],
         ['C', 'P'], ['N', 'A'], ['G', 'T'],
         ['R', 'E'], ['F', 'S'], ['J', 'W'],
         ['H', 'U'], ['V', 'I'], ['L', 'Y'],
         ['Z', 'M']].freeze

def block_word?(str)
  temp_block = []
  BLOCK.each { |array| temp_block << array } 
  match_array = []

  str.each_char do |char|
    temp_block.each_with_index do |array, index|
      if array.include?(char.upcase)
        temp_block.delete_at(index)
        match_array << char
      end
    end
  end
  str == match_array.join
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true