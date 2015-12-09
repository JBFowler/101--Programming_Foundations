# A mortgage calculator used to calculate the monthly payment on an amortized loan.

# P = L[c(1 + c)^n]/[(1 + c)^n - 1]
require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(msg, arg='')
  if arg.empty?
    puts "=> #{msg}"
  else
    puts "=> #{msg}" + "#{arg}."
  end
rescue
  if arg.nil?
    puts "=> #{msg}"
  else
    puts "=> #{msg}" + "#{arg}."
  end
end

def integer?(num)
  Integer(num) rescue false || num < 0
end

def float?(num)
  Float(num) rescue false || num < 0
end

def number?(input)
  integer?(input) || float?(input)
end

def monthly_interest_rate
  @rate /= 12
end

def monthly_duration
  @loan_time *= 12
end

def calculate_payment
  @payment = @loan_amount * ((@rate * (1 + @rate)**@loan_time) / ((1 + @rate)**@loan_time - 1))
end

prompt(MESSAGES['intro'])
name = gets.chomp

loop do
  if name.empty?
    prompt(MESSAGES['name_error'])
    name = gets.chomp
  else
    prompt(MESSAGES['welcome'], name)
    sleep(1)
    break
  end
end
loop do
  prompt(MESSAGES['loan_remaining'])
  @loan_amount = gets.chomp.to_f

  loop do
    if number?(@loan_amount)
      break
    else
      prompt(MESSAGES['loan_remaining_error'])
      @loan_amount = gets.chomp
    end
  end

  prompt(MESSAGES['apr'])
  @rate = gets.chomp.to_f

  loop do
    if number?(@rate)
      @rate /= 100
      break
    else
      prompt(MESSAGES['rate_error'])
      @rate = gets.chomp
    end
  end

  prompt(MESSAGES['loan_duration'])
  @loan_time = gets.chomp.to_f

  loop do
    if number?(@loan_time)
      break
    else
      prompt(MESSAGES['loan_duration_error'])
      @loan_time = gets.chomp
    end
  end

  prompt(MESSAGES['calculating'])
  sleep(2)

  monthly_interest_rate
  monthly_duration
  calculate_payment

  prompt(MESSAGES['total'], format('%20.2f', @payment))
  sleep(1)
  prompt(MESSAGES['again'])
  run_again = gets.chomp
  break unless run_again.downcase.start_with?('y')
end
