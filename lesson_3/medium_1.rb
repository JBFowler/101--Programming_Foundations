# Answers to Medium 1 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

# method for question 5
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

def titleize(str)
  str.split.map { |word| word.downcase.capitalize! }.join(" ")
end

def question1
  question(1)
  space = ""
  10.times do
    puts "#{space}The Flintstones Rock!"
    space += " "
  end
  # 10.times do |number|
  #   puts (" " * number) + "The Flintstones Rock!"
  # end
end

def question2
  question(2)
  statement = "The Flintstones Rock"
  result = {}
  alphabet = ("A".."Z").to_a + ("a".."z").to_a
  alphabet.each do |letter|
    letter_frequency = statement.scan(letter).count
    result[letter] = letter_frequency if letter_frequency > 0
  end
  puts result
end

def question3
  question(3)
  prompt("This causes a type error because you are trying to concatenate a string and an integer.  You need to call to_s on the integer after it's value has been calculated.")
end

def question4
  question(4)
  prompt("The output of the code would be returning the values that were taken off of the front of the array and second in the array after the first is removed, in this case the number 1 and 3.")
  prompt("The output of this code would be similar, except that it would return the first and second value because the values are being taken off of the end of the array.  In this case 1 and 2.")
end

def question5
  question(5)
  prompt(factors(16))
end

def question6
  question(6)
  prompt("While both methods return the same value, rolling_buffer1 will actually modify the 'buffer' input, as the '<<' method modifies its caller.")
end

def question7
  question(7)
  prompt("'limit' is a variable set outside of the method, and methods do not have access to local variables.  You could either make the variable an instance variable or set the variable as an argument and part of the 'fib' method.")
end

def question8
  question(8)
  prompt(titleize("What is going on?"))
end

def question9
  question(9)
  munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  munsters.each do |key, value|
    case value["age"]
    when 0..17 # 0...18
      value["age_group"] = "kid"
    when 18..64 # 18...65
      value["age_group"] = "adult"
    else
      value["age_group"] = "senior"
    end
  end
  prompt(munsters)
end

question1
question2
question3
question4
question5
question6
question7
question8
question9
