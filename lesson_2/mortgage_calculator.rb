# A mortgage calculator used to calculate the monthly payment on an amortized loan.

# P = L[c(1 + c)^n]/[(1 + c)^n - 1]
require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(msg, arg = '')
  if arg.to_s.empty?
    puts "=> #{msg}"
  else
    puts "=> #{msg}" + "#{arg}."
  end
end

def integer?(str)
  (str.to_i.to_s == str) || (str.to_i > 0)
end

def float?(str)
  (str.to_f.to_s == str) || (str.to_f > 0)
end

def number?(input)
  integer?(input) || float?(input)
end

def monthly_interest_rate(r)
  r / 12
end

def monthly_duration(ml)
  ml * 12
end

def calculate_payment(la, r, ml)
  la * ((r * (1 + r)**ml) / ((1 + r)**ml - 1))
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
  loan_amount = gets.chomp.to_f

  loop do
    if number?(loan_amount)
      break
    else
      prompt(MESSAGES['loan_remaining_error'])
      loan_amount = gets.chomp.to_f
    end
  end

  prompt(MESSAGES['apr'])
  rate = gets.chomp.to_f

  loop do
    if number?(rate)
      rate /= 100
      break
    else
      prompt(MESSAGES['rate_error'])
      rate = gets.chomp.to_f
    end
  end

  prompt(MESSAGES['loan_duration'])
  loan_time = gets.chomp.to_f

  loop do
    if number?(loan_time)
      break
    else
      prompt(MESSAGES['loan_duration_error'])
      loan_time = gets.chomp.to_f
    end
  end

  prompt(MESSAGES['calculating'])
  sleep(2)

  rate = monthly_interest_rate(rate)
  loan_time = monthly_duration(loan_time)
  prompt(MESSAGES['total'], format('%20.2f', calculate_payment(loan_amount, rate, loan_time)))
  sleep(1)
  prompt(MESSAGES['again'])
  run_again = gets.chomp
  break unless run_again.downcase.start_with?('y')
end
