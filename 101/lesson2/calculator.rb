require 'pry'

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Muliplying'
  when '4'
    'Deviding'
  end
end

prompt("Welcome to Calculator! Enter your name")
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure you use a valid name.")
  else
    break
  end
end

prompt("Welcome, #{name}")

loop do # main loop
  number1 = nil
  number2 = nil

  loop do
    prompt("Please enter a number")
    number1 = gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt("Sorry, that doesn't look like a valid number!")
    end
  end

  loop do
    prompt("Please enter a second number")
    number2 = gets.chomp.to_i

    if valid_number?(number2)
      break
    else
      prompt("Sorry, that doesn't look like a valid number!")
    end
  end

  operation_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) devide
  MSG

  prompt(operation_prompt)
  operation = ''

  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Must choose, 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  case operation
  when "1"
    result = number1 + number2
    prompt("#{number1} + #{number2} = #{result}")
  when "2"
    result = number1 - number2
    prompt("#{number1} - #{number2} = #{result}")
  when "3"
    result = number1 * number2
    prompt("#{number1} * #{number2} = #{result}")
  when "4"
    result = number1 / number2
    prompt("#{number1} / #{number2} = #{result}")
  else # this else statement became irrelevant with the user input checking above
    prompt("I did not understand what operation you wanted me to complete")
  end

  prompt("Do you want to perform another calculation? Y to calculate again")
  calc_again = gets.chomp.downcase
  break unless calc_again.start_with?("y")
end

prompt("Thanks for using calculator!")
