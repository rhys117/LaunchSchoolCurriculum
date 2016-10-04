def letter_case_count(str)
  case_count = Hash.new
  case_count[:lowercase] = str.count "a-z"
  case_count[:uppercase] = str.count "A-Z"
  case_count[:neither] = str.length - (case_count[:lowercase] + case_count[:uppercase])
  case_count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }