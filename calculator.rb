require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
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

prompt('welcome')

name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

puts "Welcome #{name}!"


loop do
  num1 = ''
  num2 = ''
  operator = ''

  loop do
    prompt('first_number')
    num1 = gets.chomp

    if integer?(num1)
      break
    else
      prompt('valid_number')
    end
  end

  loop do
    prompt('second_number')
    num2 = gets.chomp

    if integer?(num2)
      break
    else
      prompt('valid_number')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  puts "#{operator_prompt}"

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('calculation')
    end
  end

  puts "#{operation_to_message(operator)} the two numbers..."

  sleep(1)

  case operator
  when '1'
    puts "#{num1.to_i + num2.to_i}"
  when '2'
    puts "#{num1.to_i - num2.to_i}"
  when '3'
    puts "#{num1.to_i * num2.to_i}"
  when '4'
    puts "#{num1.to_f / num2.to_f}"
  end

  prompt('run_again')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
