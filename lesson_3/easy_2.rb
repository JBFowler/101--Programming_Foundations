# Answers to Easy 2 exercises

def prompt(msg)
  puts "=> #{msg}"
  gets
end

def question(num)
  prompt("Answer to question #{num}:")
end

def question1
  question(1)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  prompt(ages)
  prompt("ages.include?('Spot')")
  prompt(ages.include?("Spot"))
  prompt("ages.has_key?('Spot')")
  prompt(ages.has_key?("Spot"))
  prompt("ages.key?('Spot')")
  prompt(ages.key?("Spot"))
  prompt("ages.member?('Spot')")
  prompt(ages.member?("Spot"))
end

def question2
  question(2)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  prompt(ages)
  prompt("All ages added together equals:")
  total = 0
  ages.values.each do |value|
    total += value
  end
  prompt(total)
  prompt(ages.values.inject(:+))
end

def question3
  question(3)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  prompt(ages)
  prompt("Delete people aged over 100")
  ages.delete_if { |key, value| value > 100 }
  prompt(ages)
end

def question4
  question(4)
  munsters_description = "The Munsters are creepy in a good way."
  prompt(munsters_description)
  prompt(munsters_description.capitalize)
  prompt(munsters_description.swapcase)
  prompt(munsters_description.downcase)
  prompt(munsters_description.upcase)
end

def question5
  question(5)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  prompt(ages)
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }
  prompt("Add #{additional_ages}.")
  ages.merge!(additional_ages)
  prompt(ages)
end

def question6
  question(6)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  prompt(ages)
  prompt("What's the youngest age?")
  prompt(ages.values.min)
end

def question7
  question(7)
  advice = "Few things in life are as important as house training your pet dinosaur."
  prompt(advice)
  prompt("Does the sentence include the 'Dino'?")
  prompt(advice.match("Dino"))
end

def question8
  question(8)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
  prompt("Find index with name starts with 'Be'")
  prompt(flintstones.index { |name| name[0, 2] == 'Be' })
end

def question9
  question(9)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
  prompt("Shorten each word to 3 characters.")
  flintstones.map! do |name|
    name[0, 3]
  end
  prompt(flintstones)
end

def question10
  question(9)
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  prompt(flintstones)
  prompt("Shorten each word to 3 characters using one line of code.")
  flintstones.map! { |name| name[0, 3] }
  prompt(flintstones)
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
