# Answers to Easy 1 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

def question1
  question(1)
  prompt("I would expect the code to print out 1 2 2 3 because the uniq method does not have a bang symbol, and is therefore not mutating.")
  numbers = [1, 2, 2, 3]
  numbers.uniq
  puts numbers
end

def question2
  question(2)
  prompt("If the symbols come at the end of a method name, the '!' symbol in ruby mutates the caller with whatever method is being called.  The '?' symbol checks for something to exist within the caller, and then returns a boolean.")
  prompt("1. Not equal.  It can be used to make comparisons in if statements.")
  prompt("2. Turns the object into the opposite boolean value.")
  prompt("3. Turns the method into a mutating method that mutates the caller.")
  prompt("4. Would check for true false, and would be followed by a ':' that would determine what to do if true or false.")
  prompt("5. Would check if something existed in the caller, and would return a boolean value.")
  prompt("6. Turns the object into their boolean value.")
end

def question3
  question(3)
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.gsub!('important', 'urgent')
  prompt(advice)
end

def question4
  question(4)
  numbers = [1, 2, 3, 4, 5]
  prompt(numbers)
  prompt("Calling numbers.delete_at(1) will delete the value at the 1 index spot.")
  numbers.delete_at(1)
  prompt(numbers)
  numbers = [1, 2, 3, 4, 5]
  prompt("Calling numbers.delete(1) will delete all integer values of 1 in the array.")
  numbers.delete(1)
  prompt(numbers)
end

def question5
  question(5)
  prompt("Is 42 between 10 and 100? (10..100).include?(42) or (10..100).cover?(42)")
  prompt("#{(10..100).include?(42)}")
end

def question6
  question(6)
  famous_words = "seven years ago..."
  prompt("First way to put 'Four score and ' in front of #{famous_words} is to use .prepend.")
  famous_words.prepend('Four score and ')
  prompt(famous_words)
  famous_words = "seven years ago..."
  prompt("The second way to put 'Four score and ' in front of #{famous_words} is to use .insert")
  famous_words.insert(0, 'Four score and ')
  prompt(famous_words)
end

def question7
  question(7)
  prompt('42.  Eval takes away the string and runs the method as a normal method.')
end

def question8
  question(8)
  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]
  prompt(flintstones)
  flintstones.flatten!
  prompt(flintstones)
end

def question9
  question(9)
  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  prompt(flintstones)
  prompt(flintstones.assoc("Barney"))
end

def question10
  question(10)
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
  prompt(flintstones)
  flintstones_hash = {}
  flintstones.each_with_index do |val, idx|
    flintstones_hash[val] = idx
  end
  prompt(flintstones_hash)
end

def question11
  question(11)
  flic;lkjt a;lkjsd  tointk  
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
question10
