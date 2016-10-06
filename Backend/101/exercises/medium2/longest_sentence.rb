sentences = File.read("longest_sentence.txt").split(/[.!?]/)
sentence_lengths = sentences.map { |sentence| sentence.split(' ').length }

p largest_length = sentence_lengths.max
puts sentences[sentence_lengths.index(largest_length)].gsub("\n", ' ').strip