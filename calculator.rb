require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  Integer(num) rescue false
end

def float?(num)
  Float(num) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['welcome_player'] + " #{name}.")

loop do
  num1 = ''
  num2 = ''
  operator = ''

  loop do
    prompt(MESSAGES['first_number'])
    num1 = gets.chomp

    if integer?(num1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    num2 = gets.chomp

    if integer?(num2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['calculation'])
    end
  end

  prompt("#{operation_to_message(operator)}" + MESSAGES['selection'])

  sleep(1)

  case operator
  when "1"
    prompt("#{num1.to_i + num2.to_i}")
  when "2"
    prompt("#{num1.to_i - num2.to_i}")
  when "3"
    prompt("#{num1.to_i * num2.to_i}")
  when "4"
    prompt("#{num1.to_f / num2.to_f}")
  end

  prompt(MESSAGES['run_again'])
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
