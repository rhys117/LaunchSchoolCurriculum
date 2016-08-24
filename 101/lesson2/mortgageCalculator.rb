require 'pry'
# loan amount
# annual percentage rate
# loan duration

# monthly interest rate?
# loan duration in months?

# m = p * (j / (1 - (1 + j)**-n))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def prompt(text)
  puts "=> #{text}"
end

def valid_number?(num)
  begin
    Float(num).is_a?(Numeric)
    return true
  rescue
    return false
  end
end

prompt "Welcome to the mortgage calculator!"

loop do # main loop
  loan_ammt = nil
  ann_perc = nil
  loan_dur = nil

  prompt "How much money have you loaned?"
  loop do
    loan_ammt = gets.chomp.gsub(/[,'$]/, '')
    break if valid_number?(loan_ammt)
    prompt "Sorry! please enter your loan amount in a numeric value eg 10000"
  end

  prompt "What is the annual percentage rate on the loan? eg 12.5%"
  loop do
    ann_perc = gets.chomp.gsub(/[%]/, '')
    break if valid_number?(ann_perc)
    prompt "Sorry! you must enter a numeric value for the annual percentage rate eg 12.5"
  end

  prompt "What is the duration of the loan in months?"
  loop do
    loan_dur = gets.chomp
    break if valid_number?(loan_dur)
    prompt "Sorry! please enter your loan duration in months as a numeric value eg 24"
  end

  p = loan_ammt.to_f
  j = (ann_perc.to_f / 100) / 12
  n = loan_dur.to_i

  month_repay = p * (j / (1 - (1 + j)**-n)).to_f

  prompt "You're monthly repayment will be $#{month_repay.round(2)}"

  prompt "Would you like to calculate another mortgage? (y/n)"
  calc_again = gets.chomp.downcase
  break if calc_again.chars.first == "n"
end

prompt "Thanks for using the mortgage calculator!"
