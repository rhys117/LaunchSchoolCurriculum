def cleanup(str)
  str.tr!("^a-zA-Z0-9", ' ').squeeze(' ')
end

# ls gsub 

def cleanup_2(str)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '