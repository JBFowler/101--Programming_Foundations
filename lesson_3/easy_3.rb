# Answers to Easy 3 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

def question1
  question(1)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
end

def question2
  question(2)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
  prompt("Add 'Dino' to list!")
  flintstones << "Dino"
  prompt(flintstones)
end

def question3
  question(3)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
  prompt("Add 'Dino' and 'Hoppy' to list!")
  flintstones.push('Dino', 'Hoppy')
  prompt(flintstones)
end

def question4
  question(4)
  advice = "Few things in life are as important as house training your pet dinosaur."
  prompt(advice)
  prompt("Remove everything starting from 'house'.")
  p advice.slice!(0, advice.index('house'))
  prompt(advice)
end

def question5
  question(5)
  statement = "The Flintstones Rock!"
  prompt(statement)
  prompt(statement.count('t'))
end

def question6
  question(6)
  title = "Flintstone Family Members"
  prompt(title.center(40))
end

question1
question2
question3
question4
question5
question6
