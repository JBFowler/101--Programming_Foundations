# Answers to Medium 1 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

def question1
  question(1)
  space = ""
  10.times do
    puts "#{space}The Flintstones Rock!"
    space += " "
  end
  # 10.times do |number|
  #   puts ("word" * number) + "The Flintstones Rock!"
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

question1
question2
