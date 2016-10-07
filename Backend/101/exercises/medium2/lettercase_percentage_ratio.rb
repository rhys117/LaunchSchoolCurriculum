def letter_percentages(str)
  length = str.length
  lower_case = str.count("[/a-z/]")
  upper_case = str.count("[/A-Z/]")
  neither = length - lower_case - upper_case
  
  percentages = Hash.new
  percentages[:lowercase] = lower_case.to_f / length * 100
  percentages[:uppercase] = upper_case.to_f / length * 100
  percentages[:neither] = neither.to_f / length * 100
  
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
